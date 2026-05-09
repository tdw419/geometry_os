; DESCRIPTION: Renders a cyan disk with center (428, 185) and radius 33.
; PLAN: r0=428(x), r1=185(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 185
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
