; DESCRIPTION: Composite: Places a cyan dot at position (113, 49) then Draws a purple line from (381, 16) to (329, 189).
; PLAN: r0=113(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=381(x1), r6=16(y1), r7=329(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 16
LDI r7, 329
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
