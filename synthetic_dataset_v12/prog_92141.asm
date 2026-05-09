; DESCRIPTION: Composite: Places a black line segment connecting (453, 193) to (117, 42) then Renders a white box of size 84x108 starting at (115, 9).
; PLAN: r0=453(x1), r1=193(y1), r2=117(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=9(y), r7=84(width), r8=108(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 193
LDI r2, 117
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 9
LDI r7, 84
LDI r8, 108
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
