; DESCRIPTION: Composite: Places a yellow circle of radius 76 at center (80, 168) then Renders a white line between points (254, 112) and (146, 108) then Renders a purple box of size 100x26 starting at (182, 112).
; PLAN: r0=80(x), r1=168(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x1), r6=112(y1), r7=146(x2), r8=108(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=112(y), r12=100(width), r13=26(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 168
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 112
LDI r7, 146
LDI r8, 108
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 112
LDI r12, 100
LDI r13, 26
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
