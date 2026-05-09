; DESCRIPTION: Composite: Renders a magenta box of size 109x80 starting at (363, 2) then Renders a green disk with center (410, 84) and radius 69.
; PLAN: r0=363(x), r1=2(y), r2=109(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=84(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 2
LDI r2, 109
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 84
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
