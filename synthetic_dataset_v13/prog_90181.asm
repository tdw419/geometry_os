; DESCRIPTION: Composite: Places a yellow circle of radius 55 at center (367, 160) then Draws a red line from (26, 165) to (510, 171).
; PLAN: r0=367(x), r1=160(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=165(y1), r7=510(x2), r8=171(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 160
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 165
LDI r7, 510
LDI r8, 171
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
