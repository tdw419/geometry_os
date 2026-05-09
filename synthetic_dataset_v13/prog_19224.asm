; DESCRIPTION: Composite: Places a white dot at position (68, 21) then Draws a red line from (289, 146) to (68, 144).
; PLAN: r0=68(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=146(y1), r7=68(x2), r8=144(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 146
LDI r7, 68
LDI r8, 144
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
