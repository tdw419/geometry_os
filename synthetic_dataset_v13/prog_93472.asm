; DESCRIPTION: Composite: Places a cyan 32x80 rectangle at position (412, 0) then Renders a magenta line between points (496, 52) and (316, 188).
; PLAN: r0=412(x), r1=0(y), r2=32(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x1), r6=52(y1), r7=316(x2), r8=188(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 0
LDI r2, 32
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 52
LDI r7, 316
LDI r8, 188
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
