; DESCRIPTION: Composite: Renders a yellow box of size 53x47 starting at (296, 59) then Creates a red circular shape at (173, 87) with radius 80.
; PLAN: r0=296(x), r1=59(y), r2=53(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=87(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 59
LDI r2, 53
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 87
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
