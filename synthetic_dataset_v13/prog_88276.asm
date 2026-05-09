; DESCRIPTION: Composite: Draws a white line from (241, 237) to (205, 176) then Places a white 67x34 rectangle at position (252, 8).
; PLAN: r0=241(x1), r1=237(y1), r2=205(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=8(y), r7=67(width), r8=34(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 237
LDI r2, 205
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 8
LDI r7, 67
LDI r8, 34
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
