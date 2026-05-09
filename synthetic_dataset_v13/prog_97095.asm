; DESCRIPTION: Composite: Renders a green box of size 42x74 starting at (171, 77) then Places a white dot at position (403, 96) then Draws a orange line from (384, 107) to (432, 229).
; PLAN: r0=171(x), r1=77(y), r2=42(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=384(x1), r11=107(y1), r12=432(x2), r13=229(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 77
LDI r2, 42
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 384
LDI r11, 107
LDI r12, 432
LDI r13, 229
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
