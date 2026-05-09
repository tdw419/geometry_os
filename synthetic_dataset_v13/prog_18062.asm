; DESCRIPTION: Composite: Places a black dot at position (91, 41) then Draws a white line from (80, 255) to (37, 204).
; PLAN: r0=91(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=255(y1), r7=37(x2), r8=204(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 41
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 255
LDI r7, 37
LDI r8, 204
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
