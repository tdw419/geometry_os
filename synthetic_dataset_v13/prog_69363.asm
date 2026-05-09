; DESCRIPTION: Composite: Renders a blue line between points (302, 214) and (149, 225) then Places a cyan circle of radius 70 at center (273, 89).
; PLAN: r0=302(x1), r1=214(y1), r2=149(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=89(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 302
LDI r1, 214
LDI r2, 149
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 89
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
