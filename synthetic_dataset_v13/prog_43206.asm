; DESCRIPTION: Composite: Places a blue dot at position (151, 44) then Draws a black line from (227, 25) to (411, 59).
; PLAN: r0=151(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=227(x1), r6=25(y1), r7=411(x2), r8=59(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 25
LDI r7, 411
LDI r8, 59
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
