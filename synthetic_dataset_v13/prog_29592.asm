; DESCRIPTION: Composite: Creates a blue circular shape at (292, 224) with radius 22 then Renders a green box of size 47x16 starting at (462, 98).
; PLAN: r0=292(x), r1=224(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x), r6=98(y), r7=47(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 224
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 98
LDI r7, 47
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
