; DESCRIPTION: Composite: Renders a red line between points (229, 210) and (128, 154) then Renders a black box of size 49x30 starting at (296, 70).
; PLAN: r0=229(x1), r1=210(y1), r2=128(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=70(y), r7=49(width), r8=30(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 210
LDI r2, 128
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 70
LDI r7, 49
LDI r8, 30
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
