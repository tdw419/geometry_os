; DESCRIPTION: Composite: Places a white dot at position (400, 185) then Renders a white box of size 79x11 starting at (364, 207).
; PLAN: r0=400(x), r1=185(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=207(y), r7=79(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 185
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 207
LDI r7, 79
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
