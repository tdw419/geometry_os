; DESCRIPTION: Composite: Places a purple dot at position (55, 98) then Draws a purple line from (403, 207) to (170, 244).
; PLAN: r0=55(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=403(x1), r6=207(y1), r7=170(x2), r8=244(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 207
LDI r7, 170
LDI r8, 244
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
