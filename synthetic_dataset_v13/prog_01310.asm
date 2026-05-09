; DESCRIPTION: Composite: Draws a white circle centered at (339, 81) with radius 65 then Renders a cyan line between points (210, 100) and (18, 74) then Draws a blue rectangle at (168, 182) with width 46 and height 53.
; PLAN: r0=339(x), r1=81(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=100(y1), r7=18(x2), r8=74(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=182(y), r12=46(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 81
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 100
LDI r7, 18
LDI r8, 74
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 182
LDI r12, 46
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
