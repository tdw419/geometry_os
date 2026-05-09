; DESCRIPTION: Composite: Creates a orange circular shape at (295, 120) with radius 60 then Renders a white box of size 115x13 starting at (273, 150).
; PLAN: r0=295(x), r1=120(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=150(y), r7=115(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 120
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 150
LDI r7, 115
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
