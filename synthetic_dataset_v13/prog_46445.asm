; DESCRIPTION: Composite: Places a cyan circle of radius 80 at center (381, 132) then Renders a yellow box of size 85x68 starting at (194, 20).
; PLAN: r0=381(x), r1=132(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=20(y), r7=85(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 132
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 20
LDI r7, 85
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
