; DESCRIPTION: Renders a red disk with center (403, 164) and radius 22.
; PLAN: r0=403(x), r1=164(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 164
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
