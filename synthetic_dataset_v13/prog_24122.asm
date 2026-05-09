; DESCRIPTION: Composite: Places a yellow dot at position (282, 54) then Draws a black line from (162, 88) to (267, 28).
; PLAN: r0=282(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=162(x1), r6=88(y1), r7=267(x2), r8=28(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 162
LDI r6, 88
LDI r7, 267
LDI r8, 28
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
