; DESCRIPTION: Composite: Places a orange circle of radius 73 at center (263, 118) then Places a green 30x42 rectangle at position (14, 36).
; PLAN: r0=263(x), r1=118(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=36(y), r7=30(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 118
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 36
LDI r7, 30
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
