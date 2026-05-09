; DESCRIPTION: Composite: Sets a single yellow pixel at (333, 0) then Renders a purple box of size 109x35 starting at (166, 124) then Renders a green line between points (123, 149) and (45, 72).
; PLAN: r0=333(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=124(y), r7=109(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x1), r11=149(y1), r12=45(x2), r13=72(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 124
LDI r7, 109
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 149
LDI r12, 45
LDI r13, 72
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
