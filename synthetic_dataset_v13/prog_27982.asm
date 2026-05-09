; DESCRIPTION: Composite: Places a blue dot at position (369, 123) then Renders a red line between points (152, 73) and (356, 189).
; PLAN: r0=369(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=73(y1), r7=356(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 73
LDI r7, 356
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
