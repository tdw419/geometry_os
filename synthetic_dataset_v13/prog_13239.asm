; DESCRIPTION: Composite: Places a magenta dot at position (299, 128) then Creates a orange rectangular region at (186, 27) spanning 54 by 96 pixels then Places a magenta line segment connecting (41, 140) to (246, 87).
; PLAN: r0=299(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=27(y), r7=54(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=41(x1), r11=140(y1), r12=246(x2), r13=87(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 27
LDI r7, 54
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 140
LDI r12, 246
LDI r13, 87
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
