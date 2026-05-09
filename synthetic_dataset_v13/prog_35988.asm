; DESCRIPTION: Composite: Places a cyan line segment connecting (402, 9) to (114, 115) then Renders a yellow box of size 64x42 starting at (129, 119).
; PLAN: r0=402(x1), r1=9(y1), r2=114(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=119(y), r7=64(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 9
LDI r2, 114
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 119
LDI r7, 64
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
