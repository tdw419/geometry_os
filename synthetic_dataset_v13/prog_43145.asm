; DESCRIPTION: Creates a red circular shape at (296, 113) with radius 75.
; PLAN: r0=296(x), r1=113(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 113
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
