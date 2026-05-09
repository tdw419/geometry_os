; DESCRIPTION: Composite: Places a yellow dot at position (130, 2) then Renders a orange line between points (302, 106) and (386, 247) then Draws a red rectangle at (422, 146) with width 26 and height 93.
; PLAN: r0=130(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=106(y1), r7=386(x2), r8=247(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=146(y), r12=26(width), r13=93(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 302
LDI r6, 106
LDI r7, 386
LDI r8, 247
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 146
LDI r12, 26
LDI r13, 93
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
