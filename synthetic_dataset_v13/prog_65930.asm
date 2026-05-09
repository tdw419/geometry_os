; DESCRIPTION: Composite: Renders a orange disk with center (262, 93) and radius 76 then Creates a green rectangular region at (190, 138) spanning 95 by 20 pixels.
; PLAN: r0=262(x), r1=93(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=138(y), r7=95(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 93
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 138
LDI r7, 95
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
