; DESCRIPTION: Composite: Places a red circle of radius 35 at center (212, 68) then Places a cyan 32x94 rectangle at position (290, 64) then Places a red line segment connecting (439, 249) to (208, 62).
; PLAN: r0=212(x), r1=68(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=64(y), r7=32(width), r8=94(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x1), r11=249(y1), r12=208(x2), r13=62(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 68
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 64
LDI r7, 32
LDI r8, 94
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 249
LDI r12, 208
LDI r13, 62
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
