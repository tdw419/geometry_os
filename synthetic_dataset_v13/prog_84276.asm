; DESCRIPTION: Composite: Renders a cyan box of size 85x52 starting at (320, 44) then Renders a green disk with center (260, 30) and radius 26.
; PLAN: r0=320(x), r1=44(y), r2=85(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=30(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 44
LDI r2, 85
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 30
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
