; DESCRIPTION: Renders a cyan disk with center (398, 76) and radius 57.
; PLAN: r0=398(x), r1=76(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 76
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
