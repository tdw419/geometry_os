; DESCRIPTION: Renders a yellow disk with center (398, 47) and radius 27.
; PLAN: r0=398(x), r1=47(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 47
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
