; DESCRIPTION: Composite: Renders a orange disk with center (425, 188) and radius 20 then Renders a cyan box of size 87x42 starting at (256, 10).
; PLAN: r0=425(x), r1=188(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=10(y), r7=87(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 188
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 10
LDI r7, 87
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
