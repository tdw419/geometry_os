; DESCRIPTION: Composite: Places a blue dot at position (284, 234) then Draws a orange line from (385, 253) to (1, 207).
; PLAN: r0=284(x), r1=234(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=253(y1), r7=1(x2), r8=207(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 234
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 253
LDI r7, 1
LDI r8, 207
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
