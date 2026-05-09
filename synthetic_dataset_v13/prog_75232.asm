; DESCRIPTION: Composite: Places a green dot at position (10, 255) then Renders a blue line between points (80, 12) and (407, 203).
; PLAN: r0=10(x), r1=255(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=12(y1), r7=407(x2), r8=203(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 255
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 12
LDI r7, 407
LDI r8, 203
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
