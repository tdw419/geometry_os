; DESCRIPTION: Composite: Renders a purple box of size 32x74 starting at (13, 146) then Renders a white disk with center (104, 171) and radius 48.
; PLAN: r0=13(x), r1=146(y), r2=32(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=171(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 146
LDI r2, 32
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 171
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
