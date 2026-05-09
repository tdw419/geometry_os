; DESCRIPTION: Composite: Renders a magenta line between points (180, 51) and (398, 32) then Sets a single green pixel at (219, 109).
; PLAN: r0=180(x1), r1=51(y1), r2=398(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=109(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 51
LDI r2, 398
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 109
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
