; DESCRIPTION: Composite: Draws a cyan line from (241, 139) to (57, 114) then Draws a blue rectangle at (362, 116) with width 120 and height 69 then Creates a yellow circular shape at (239, 90) with radius 46.
; PLAN: r0=241(x1), r1=139(y1), r2=57(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=116(y), r7=120(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=90(y), r12=46(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 241
LDI r1, 139
LDI r2, 57
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 116
LDI r7, 120
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 90
LDI r12, 46
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
