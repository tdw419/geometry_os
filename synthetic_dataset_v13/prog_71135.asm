; DESCRIPTION: Composite: Renders a orange disk with center (142, 146) and radius 47 then Draws a red line from (486, 6) to (243, 247).
; PLAN: r0=142(x), r1=146(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=6(y1), r7=243(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 146
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 6
LDI r7, 243
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
