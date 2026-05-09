; DESCRIPTION: Composite: Renders a blue disk with center (262, 160) and radius 64 then Creates a black rectangular region at (307, 20) spanning 49 by 120 pixels.
; PLAN: r0=262(x), r1=160(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=20(y), r7=49(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 160
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 20
LDI r7, 49
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
