; DESCRIPTION: Composite: Renders a green disk with center (90, 84) and radius 21 then Renders a purple box of size 76x21 starting at (306, 134).
; PLAN: r0=90(x), r1=84(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=134(y), r7=76(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 84
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 134
LDI r7, 76
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
