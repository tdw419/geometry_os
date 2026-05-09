; DESCRIPTION: Renders a cyan disk with center (277, 123) and radius 72.
; PLAN: r0=277(x), r1=123(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 123
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
