; DESCRIPTION: Composite: Places a green dot at position (147, 10) then Draws a black line from (34, 203) to (397, 53).
; PLAN: r0=147(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=34(x1), r6=203(y1), r7=397(x2), r8=53(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 34
LDI r6, 203
LDI r7, 397
LDI r8, 53
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
