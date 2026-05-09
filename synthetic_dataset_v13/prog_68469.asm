; DESCRIPTION: Composite: Places a orange circle of radius 77 at center (92, 101) then Draws a red line from (479, 54) to (37, 195).
; PLAN: r0=92(x), r1=101(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=54(y1), r7=37(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 101
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 54
LDI r7, 37
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
