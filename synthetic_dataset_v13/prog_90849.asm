; DESCRIPTION: Composite: Renders a yellow box of size 95x53 starting at (281, 94) then Creates a purple circular shape at (284, 173) with radius 64.
; PLAN: r0=281(x), r1=94(y), r2=95(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=173(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 94
LDI r2, 95
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 173
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
