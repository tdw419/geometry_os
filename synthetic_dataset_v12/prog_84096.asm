; DESCRIPTION: Composite: Draws a cyan line from (171, 72) to (225, 112) then Places a yellow circle of radius 24 at center (149, 145).
; PLAN: r0=171(x1), r1=72(y1), r2=225(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=145(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 72
LDI r2, 225
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 145
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
