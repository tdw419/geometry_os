; DESCRIPTION: Composite: Renders a purple disk with center (133, 189) and radius 27 then Renders a black box of size 72x39 starting at (297, 43).
; PLAN: r0=133(x), r1=189(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=43(y), r7=72(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 189
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 43
LDI r7, 72
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
