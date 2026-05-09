; DESCRIPTION: Composite: Sets a single red pixel at (72, 196) then Places a black line segment connecting (90, 42) to (150, 67).
; PLAN: r0=72(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=42(y1), r7=150(x2), r8=67(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 90
LDI r6, 42
LDI r7, 150
LDI r8, 67
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
