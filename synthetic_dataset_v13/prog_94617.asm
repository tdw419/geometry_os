; DESCRIPTION: Composite: Renders a magenta line between points (473, 67) and (18, 49) then Places a white 31x45 rectangle at position (77, 168).
; PLAN: r0=473(x1), r1=67(y1), r2=18(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=168(y), r7=31(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 67
LDI r2, 18
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 168
LDI r7, 31
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
