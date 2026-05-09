; DESCRIPTION: Composite: Renders a purple disk with center (50, 115) and radius 43 then Creates a yellow rectangular region at (168, 129) spanning 31 by 11 pixels.
; PLAN: r0=50(x), r1=115(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=129(y), r7=31(width), r8=11(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 115
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 129
LDI r7, 31
LDI r8, 11
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
