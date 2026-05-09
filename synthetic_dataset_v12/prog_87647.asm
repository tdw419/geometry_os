; DESCRIPTION: Renders a green disk with center (398, 73) and radius 67.
; PLAN: r0=398(x), r1=73(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 73
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
