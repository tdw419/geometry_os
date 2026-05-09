; DESCRIPTION: Composite: Renders a white line between points (421, 235) and (253, 252) then Places a cyan dot at position (384, 194) then Renders a green box of size 47x41 starting at (45, 99).
; PLAN: r0=421(x1), r1=235(y1), r2=253(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=194(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=45(x), r11=99(y), r12=47(width), r13=41(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 235
LDI r2, 253
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 194
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 45
LDI r11, 99
LDI r12, 47
LDI r13, 41
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
