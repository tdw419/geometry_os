; DESCRIPTION: Composite: Places a green line segment connecting (137, 152) to (125, 229) then Places a magenta dot at position (458, 230).
; PLAN: r0=137(x1), r1=152(y1), r2=125(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 152
LDI r2, 125
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
