; DESCRIPTION: Composite: Renders a purple box of size 48x99 starting at (44, 32) then Renders a yellow disk with center (217, 137) and radius 27.
; PLAN: r0=44(x), r1=32(y), r2=48(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=137(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 44
LDI r1, 32
LDI r2, 48
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 137
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
