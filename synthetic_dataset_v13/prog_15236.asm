; DESCRIPTION: Renders a green disk with center (398, 214) and radius 18.
; PLAN: r0=398(x), r1=214(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 214
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
