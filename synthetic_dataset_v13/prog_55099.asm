; DESCRIPTION: Composite: Places a black dot at position (143, 82) then Draws a red line from (205, 42) to (198, 117).
; PLAN: r0=143(x), r1=82(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=205(x1), r6=42(y1), r7=198(x2), r8=117(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 82
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 205
LDI r6, 42
LDI r7, 198
LDI r8, 117
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
