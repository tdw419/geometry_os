; DESCRIPTION: Composite: Sets a single magenta pixel at (44, 41) then Renders a blue box of size 36x70 starting at (454, 84).
; PLAN: r0=44(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=84(y), r7=36(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 41
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 84
LDI r7, 36
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
