; DESCRIPTION: Composite: Creates a cyan circular shape at (133, 52) with radius 14 then Renders a magenta box of size 102x110 starting at (95, 93).
; PLAN: r0=133(x), r1=52(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=93(y), r7=102(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 52
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 93
LDI r7, 102
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
