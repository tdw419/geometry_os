; DESCRIPTION: Composite: Places a white dot at position (120, 74) then Renders a black box of size 56x79 starting at (166, 88) then Renders a red line between points (49, 41) and (502, 183).
; PLAN: r0=120(x), r1=74(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=88(y), r7=56(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x1), r11=41(y1), r12=502(x2), r13=183(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 74
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 88
LDI r7, 56
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 41
LDI r12, 502
LDI r13, 183
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
