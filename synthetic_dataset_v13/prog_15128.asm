; DESCRIPTION: Composite: Places a orange 48x99 rectangle at position (36, 90) then Renders a purple disk with center (309, 46) and radius 37.
; PLAN: r0=36(x), r1=90(y), r2=48(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=46(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 90
LDI r2, 48
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 46
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
