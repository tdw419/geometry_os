; DESCRIPTION: Composite: Renders a cyan box of size 35x72 starting at (414, 49) then Renders a white line between points (107, 63) and (423, 178).
; PLAN: r0=414(x), r1=49(y), r2=35(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=63(y1), r7=423(x2), r8=178(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 49
LDI r2, 35
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 63
LDI r7, 423
LDI r8, 178
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
