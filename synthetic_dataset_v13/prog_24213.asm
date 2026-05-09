; DESCRIPTION: Renders a cyan disk with center (198, 138) and radius 56.
; PLAN: r0=198(x), r1=138(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 138
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
