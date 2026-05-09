; DESCRIPTION: Renders a cyan disk with center (187, 193) and radius 51.
; PLAN: r0=187(x), r1=193(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 193
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
