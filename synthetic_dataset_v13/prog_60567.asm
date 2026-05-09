; DESCRIPTION: Composite: Draws a red line from (90, 41) to (402, 48) then Renders a green box of size 42x12 starting at (378, 107).
; PLAN: r0=90(x1), r1=41(y1), r2=402(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=107(y), r7=42(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 41
LDI r2, 402
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 107
LDI r7, 42
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
