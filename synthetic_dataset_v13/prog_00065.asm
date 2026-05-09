; DESCRIPTION: Composite: Places a orange dot at position (23, 47) then Draws a black line from (64, 197) to (126, 26).
; PLAN: r0=23(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=64(x1), r6=197(y1), r7=126(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 64
LDI r6, 197
LDI r7, 126
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
