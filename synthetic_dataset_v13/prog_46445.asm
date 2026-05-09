; DESCRIPTION: Composite: Renders a yellow box of size 82x62 starting at (304, 35) then Creates a red circular shape at (36, 38) with radius 27.
; PLAN: r0=304(x), r1=35(y), r2=82(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=38(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 35
LDI r2, 82
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 38
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
