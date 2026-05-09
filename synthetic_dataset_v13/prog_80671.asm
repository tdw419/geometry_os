; DESCRIPTION: Composite: Places a orange dot at position (27, 28) then Places a black line segment connecting (63, 59) to (30, 217).
; PLAN: r0=27(x), r1=28(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=59(y1), r7=30(x2), r8=217(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 28
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 63
LDI r6, 59
LDI r7, 30
LDI r8, 217
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
