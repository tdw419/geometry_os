; DESCRIPTION: Composite: Draws a blue line from (270, 192) to (252, 238) then Sets a single white pixel at (373, 213) then Renders a orange box of size 83x57 starting at (69, 16).
; PLAN: r0=270(x1), r1=192(y1), r2=252(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=213(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=16(y), r12=83(width), r13=57(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 192
LDI r2, 252
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 213
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 69
LDI r11, 16
LDI r12, 83
LDI r13, 57
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
