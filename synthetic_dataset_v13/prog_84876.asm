; DESCRIPTION: Renders a green disk with center (198, 205) and radius 14.
; PLAN: r0=198(x), r1=205(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 205
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
