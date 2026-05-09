; DESCRIPTION: Composite: Places a purple dot at position (67, 26) then Places a white line segment connecting (173, 28) to (168, 249).
; PLAN: r0=67(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=28(y1), r7=168(x2), r8=249(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 28
LDI r7, 168
LDI r8, 249
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
