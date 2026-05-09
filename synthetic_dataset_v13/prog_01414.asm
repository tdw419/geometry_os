; DESCRIPTION: Composite: Renders a white disk with center (218, 59) and radius 30 then Renders a purple box of size 111x45 starting at (134, 178).
; PLAN: r0=218(x), r1=59(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=178(y), r7=111(width), r8=45(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 59
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 178
LDI r7, 111
LDI r8, 45
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
