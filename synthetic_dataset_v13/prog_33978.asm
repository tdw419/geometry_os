; DESCRIPTION: Composite: Places a white dot at position (67, 67) then Renders a magenta line between points (290, 132) and (12, 14).
; PLAN: r0=67(x), r1=67(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x1), r6=132(y1), r7=12(x2), r8=14(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 67
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 132
LDI r7, 12
LDI r8, 14
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
