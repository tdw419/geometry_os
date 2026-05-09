; DESCRIPTION: Composite: Places a orange dot at position (501, 197) then Draws a red line from (58, 204) to (500, 43).
; PLAN: r0=501(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=58(x1), r6=204(y1), r7=500(x2), r8=43(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 58
LDI r6, 204
LDI r7, 500
LDI r8, 43
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
