; DESCRIPTION: Composite: Places a red circle of radius 13 at center (53, 77) then Renders a purple box of size 63x119 starting at (36, 120).
; PLAN: r0=53(x), r1=77(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=120(y), r7=63(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 77
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 120
LDI r7, 63
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
