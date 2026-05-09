; DESCRIPTION: Composite: Sets a single black pixel at (232, 32) then Draws a yellow line from (114, 59) to (144, 184).
; PLAN: r0=232(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=59(y1), r7=144(x2), r8=184(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 114
LDI r6, 59
LDI r7, 144
LDI r8, 184
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
