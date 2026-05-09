; DESCRIPTION: Composite: Creates a purple circular shape at (116, 120) with radius 80 then Places a magenta 95x24 rectangle at position (370, 154).
; PLAN: r0=116(x), r1=120(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=154(y), r7=95(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 120
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 154
LDI r7, 95
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
