; DESCRIPTION: Renders a white disk with center (398, 164) and radius 70.
; PLAN: r0=398(x), r1=164(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 164
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
