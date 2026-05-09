; DESCRIPTION: Composite: Places a green dot at position (207, 20) then Renders a black line between points (485, 136) and (28, 67).
; PLAN: r0=207(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=136(y1), r7=28(x2), r8=67(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 485
LDI r6, 136
LDI r7, 28
LDI r8, 67
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
