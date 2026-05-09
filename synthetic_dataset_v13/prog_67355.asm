; DESCRIPTION: Composite: Places a green line segment connecting (246, 254) to (45, 160) then Sets a single magenta pixel at (184, 231).
; PLAN: r0=246(x1), r1=254(y1), r2=45(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 246
LDI r1, 254
LDI r2, 45
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
