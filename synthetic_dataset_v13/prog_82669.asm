; DESCRIPTION: Composite: Places a purple circle of radius 12 at center (149, 175) then Renders a orange box of size 120x71 starting at (374, 44).
; PLAN: r0=149(x), r1=175(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=44(y), r7=120(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 175
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 44
LDI r7, 120
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
