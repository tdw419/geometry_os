; DESCRIPTION: Composite: Places a black 120x59 rectangle at position (341, 37) then Renders a red line between points (222, 122) and (245, 136).
; PLAN: r0=341(x), r1=37(y), r2=120(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=122(y1), r7=245(x2), r8=136(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 37
LDI r2, 120
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 122
LDI r7, 245
LDI r8, 136
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
