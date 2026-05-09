; DESCRIPTION: Composite: Renders a blue box of size 103x51 starting at (55, 119) then Renders a blue line between points (503, 136) and (117, 255) then Sets a single magenta pixel at (401, 10).
; PLAN: r0=55(x), r1=119(y), r2=103(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x1), r6=136(y1), r7=117(x2), r8=255(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=10(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 119
LDI r2, 103
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 136
LDI r7, 117
LDI r8, 255
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 10
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
