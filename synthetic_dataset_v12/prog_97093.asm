; DESCRIPTION: Renders a orange disk with center (287, 129) and radius 67.
; PLAN: r0=287(x), r1=129(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 129
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
