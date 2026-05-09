; DESCRIPTION: Composite: Places a yellow 31x98 rectangle at position (45, 39) then Draws a white line from (44, 245) to (50, 199).
; PLAN: r0=45(x), r1=39(y), r2=31(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x1), r6=245(y1), r7=50(x2), r8=199(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 39
LDI r2, 31
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 245
LDI r7, 50
LDI r8, 199
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
