; DESCRIPTION: Composite: Places a white dot at position (346, 9) then Draws a green line from (319, 26) to (394, 137).
; PLAN: r0=346(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=26(y1), r7=394(x2), r8=137(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 9
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 26
LDI r7, 394
LDI r8, 137
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
