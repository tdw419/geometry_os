; DESCRIPTION: Draws a red circle centered at (400, 129) with radius 74.
; PLAN: r0=400(x), r1=129(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 129
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
