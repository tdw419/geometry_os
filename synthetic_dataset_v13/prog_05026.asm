; DESCRIPTION: Composite: Places a yellow line segment connecting (365, 51) to (223, 64) then Places a green circle of radius 59 at center (94, 125).
; PLAN: r0=365(x1), r1=51(y1), r2=223(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=125(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 51
LDI r2, 223
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 125
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
