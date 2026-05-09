; DESCRIPTION: Composite: Places a magenta dot at position (231, 237) then Places a yellow line segment connecting (51, 232) to (92, 81).
; PLAN: r0=231(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=51(x1), r6=232(y1), r7=92(x2), r8=81(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 232
LDI r7, 92
LDI r8, 81
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
