; DESCRIPTION: Composite: Renders a white line between points (149, 55) and (219, 220) then Sets a single white pixel at (299, 231).
; PLAN: r0=149(x1), r1=55(y1), r2=219(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=231(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 55
LDI r2, 219
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 231
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
