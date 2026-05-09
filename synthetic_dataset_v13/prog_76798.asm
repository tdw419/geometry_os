; DESCRIPTION: Composite: Creates a red circular shape at (73, 105) with radius 68 then Places a blue 42x119 rectangle at position (429, 79).
; PLAN: r0=73(x), r1=105(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=79(y), r7=42(width), r8=119(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 105
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 79
LDI r7, 42
LDI r8, 119
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
