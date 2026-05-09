; DESCRIPTION: Composite: Places a cyan 32x12 rectangle at position (371, 9) then Draws a orange line from (474, 167) to (290, 245).
; PLAN: r0=371(x), r1=9(y), r2=32(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=167(y1), r7=290(x2), r8=245(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 9
LDI r2, 32
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 167
LDI r7, 290
LDI r8, 245
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
