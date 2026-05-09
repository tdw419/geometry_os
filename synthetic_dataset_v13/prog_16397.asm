; DESCRIPTION: Composite: Places a yellow line segment connecting (459, 228) to (53, 5) then Sets a single red pixel at (307, 115).
; PLAN: r0=459(x1), r1=228(y1), r2=53(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=115(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 459
LDI r1, 228
LDI r2, 53
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 115
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
