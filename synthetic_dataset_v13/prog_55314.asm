; DESCRIPTION: Composite: Places a black dot at position (301, 124) then Places a magenta circle of radius 76 at center (145, 135) then Renders a green line between points (68, 13) and (86, 161).
; PLAN: r0=301(x), r1=124(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=135(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x1), r11=13(y1), r12=86(x2), r13=161(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 124
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 145
LDI r6, 135
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 13
LDI r12, 86
LDI r13, 161
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
