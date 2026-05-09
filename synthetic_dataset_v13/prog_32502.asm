; DESCRIPTION: Composite: Places a red line segment connecting (172, 128) to (66, 56) then Places a magenta dot at position (337, 237).
; PLAN: r0=172(x1), r1=128(y1), r2=66(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=237(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 128
LDI r2, 66
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 237
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
