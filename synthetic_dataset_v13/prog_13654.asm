; DESCRIPTION: Composite: Places a blue 33x10 rectangle at position (152, 11) then Renders a black line between points (388, 43) and (131, 147).
; PLAN: r0=152(x), r1=11(y), r2=33(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=43(y1), r7=131(x2), r8=147(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 11
LDI r2, 33
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 43
LDI r7, 131
LDI r8, 147
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
