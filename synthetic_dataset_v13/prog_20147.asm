; DESCRIPTION: Composite: Places a white dot at position (441, 202) then Renders a yellow line between points (324, 129) and (414, 65) then Places a magenta 85x117 rectangle at position (308, 41).
; PLAN: r0=441(x), r1=202(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=129(y1), r7=414(x2), r8=65(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=41(y), r12=85(width), r13=117(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 202
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 129
LDI r7, 414
LDI r8, 65
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 41
LDI r12, 85
LDI r13, 117
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
