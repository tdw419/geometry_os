; DESCRIPTION: Composite: Creates a green rectangular region at (363, 126) spanning 103 by 95 pixels then Renders a purple disk with center (400, 233) and radius 13.
; PLAN: r0=363(x), r1=126(y), r2=103(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=233(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 126
LDI r2, 103
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 233
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
