; DESCRIPTION: Composite: Renders a orange disk with center (363, 166) and radius 19 then Creates a blue rectangular region at (383, 92) spanning 103 by 14 pixels.
; PLAN: r0=363(x), r1=166(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=92(y), r7=103(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 166
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 92
LDI r7, 103
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
