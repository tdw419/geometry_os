; DESCRIPTION: Renders a red disk with center (387, 205) and radius 22.
; PLAN: r0=387(x), r1=205(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 205
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
