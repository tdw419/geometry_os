; DESCRIPTION: Composite: Draws a white line from (109, 246) to (49, 130) then Places a white 22x49 rectangle at position (227, 120).
; PLAN: r0=109(x1), r1=246(y1), r2=49(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=120(y), r7=22(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 246
LDI r2, 49
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 120
LDI r7, 22
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
