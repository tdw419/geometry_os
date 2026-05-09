; DESCRIPTION: Composite: Renders a yellow line between points (381, 78) and (430, 202) then Places a cyan 58x35 rectangle at position (320, 8).
; PLAN: r0=381(x1), r1=78(y1), r2=430(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=8(y), r7=58(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 78
LDI r2, 430
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 8
LDI r7, 58
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
