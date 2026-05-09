; DESCRIPTION: Composite: Places a black 29x78 rectangle at position (430, 174) then Renders a black line between points (329, 49) and (198, 233).
; PLAN: r0=430(x), r1=174(y), r2=29(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x1), r6=49(y1), r7=198(x2), r8=233(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 174
LDI r2, 29
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 49
LDI r7, 198
LDI r8, 233
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
