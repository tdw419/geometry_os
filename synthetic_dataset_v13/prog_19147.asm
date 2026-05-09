; DESCRIPTION: Composite: Creates a purple circular shape at (309, 129) with radius 74 then Renders a yellow box of size 18x47 starting at (293, 154).
; PLAN: r0=309(x), r1=129(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=154(y), r7=18(width), r8=47(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 129
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 154
LDI r7, 18
LDI r8, 47
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
