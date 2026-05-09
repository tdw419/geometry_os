; DESCRIPTION: Composite: Places a orange dot at position (308, 181) then Draws a cyan line from (189, 237) to (331, 38).
; PLAN: r0=308(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=237(y1), r7=331(x2), r8=38(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 189
LDI r6, 237
LDI r7, 331
LDI r8, 38
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
