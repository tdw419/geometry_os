; DESCRIPTION: Composite: Places a blue dot at position (510, 115) then Draws a orange line from (66, 173) to (364, 219).
; PLAN: r0=510(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=173(y1), r7=364(x2), r8=219(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 173
LDI r7, 364
LDI r8, 219
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
