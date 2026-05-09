; DESCRIPTION: Renders a red disk with center (180, 124) and radius 23.
; PLAN: r0=180(x), r1=124(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 124
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
