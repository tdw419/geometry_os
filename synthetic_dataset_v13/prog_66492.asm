; DESCRIPTION: Renders a cyan disk with center (398, 91) and radius 71.
; PLAN: r0=398(x), r1=91(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 91
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
