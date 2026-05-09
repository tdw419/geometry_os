; DESCRIPTION: Renders a cyan disk with center (108, 180) and radius 40.
; PLAN: r0=108(x), r1=180(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 180
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
