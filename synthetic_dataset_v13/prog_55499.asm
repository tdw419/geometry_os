; DESCRIPTION: Composite: Creates a purple circular shape at (327, 122) with radius 67 then Renders a yellow box of size 79x57 starting at (109, 82).
; PLAN: r0=327(x), r1=122(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=82(y), r7=79(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 122
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 82
LDI r7, 79
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
