; DESCRIPTION: Composite: Draws a white line from (161, 99) to (107, 41) then Renders a yellow disk with center (412, 138) and radius 59.
; PLAN: r0=161(x1), r1=99(y1), r2=107(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=138(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 99
LDI r2, 107
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 138
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
