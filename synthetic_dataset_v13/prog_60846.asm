; DESCRIPTION: Composite: Renders a yellow disk with center (244, 139) and radius 79 then Renders a black box of size 87x90 starting at (290, 95).
; PLAN: r0=244(x), r1=139(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=95(y), r7=87(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 139
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 95
LDI r7, 87
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
