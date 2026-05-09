; DESCRIPTION: Composite: Places a yellow dot at position (16, 151) then Draws a red line from (390, 111) to (189, 92).
; PLAN: r0=16(x), r1=151(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=390(x1), r6=111(y1), r7=189(x2), r8=92(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 151
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 390
LDI r6, 111
LDI r7, 189
LDI r8, 92
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
