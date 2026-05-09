; DESCRIPTION: Composite: Renders a yellow disk with center (320, 69) and radius 60 then Places a cyan line segment connecting (30, 179) to (144, 189).
; PLAN: r0=320(x), r1=69(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=179(y1), r7=144(x2), r8=189(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 69
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 179
LDI r7, 144
LDI r8, 189
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
