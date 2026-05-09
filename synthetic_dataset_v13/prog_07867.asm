; DESCRIPTION: Composite: Renders a white line between points (109, 229) and (397, 222) then Renders a black box of size 91x78 starting at (207, 57).
; PLAN: r0=109(x1), r1=229(y1), r2=397(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=57(y), r7=91(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 229
LDI r2, 397
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 57
LDI r7, 91
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
