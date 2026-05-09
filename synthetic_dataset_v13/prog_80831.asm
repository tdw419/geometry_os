; DESCRIPTION: Composite: Places a magenta dot at position (164, 251) then Draws a orange line from (416, 15) to (253, 12).
; PLAN: r0=164(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=416(x1), r6=15(y1), r7=253(x2), r8=12(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 251
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 15
LDI r7, 253
LDI r8, 12
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
