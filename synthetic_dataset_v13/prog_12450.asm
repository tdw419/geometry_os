; DESCRIPTION: Composite: Sets a single white pixel at (329, 74) then Draws a green line from (128, 247) to (449, 189).
; PLAN: r0=329(x), r1=74(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=128(x1), r6=247(y1), r7=449(x2), r8=189(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 74
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 247
LDI r7, 449
LDI r8, 189
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
