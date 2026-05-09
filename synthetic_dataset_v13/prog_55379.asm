; DESCRIPTION: Composite: Draws a purple line from (278, 49) to (144, 62) then Places a magenta 100x48 rectangle at position (263, 123).
; PLAN: r0=278(x1), r1=49(y1), r2=144(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=123(y), r7=100(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 49
LDI r2, 144
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 123
LDI r7, 100
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
