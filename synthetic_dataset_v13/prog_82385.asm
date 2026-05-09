; DESCRIPTION: Composite: Draws a cyan circle centered at (295, 179) with radius 69 then Renders a green box of size 62x25 starting at (153, 32).
; PLAN: r0=295(x), r1=179(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=32(y), r7=62(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 179
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 32
LDI r7, 62
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
