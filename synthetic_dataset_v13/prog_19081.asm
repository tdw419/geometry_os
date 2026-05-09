; DESCRIPTION: Renders a cyan disk with center (313, 108) and radius 51.
; PLAN: r0=313(x), r1=108(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 108
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
