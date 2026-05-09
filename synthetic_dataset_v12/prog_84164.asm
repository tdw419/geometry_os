; DESCRIPTION: Composite: Sets a single white pixel at (128, 42) then Draws a black line from (273, 230) to (297, 87).
; PLAN: r0=128(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=273(x1), r6=230(y1), r7=297(x2), r8=87(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 42
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 230
LDI r7, 297
LDI r8, 87
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
