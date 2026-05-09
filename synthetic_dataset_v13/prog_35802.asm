; DESCRIPTION: Composite: Places a green 91x76 rectangle at position (29, 138) then Renders a black line between points (222, 90) and (245, 92).
; PLAN: r0=29(x), r1=138(y), r2=91(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=90(y1), r7=245(x2), r8=92(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 138
LDI r2, 91
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 90
LDI r7, 245
LDI r8, 92
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
