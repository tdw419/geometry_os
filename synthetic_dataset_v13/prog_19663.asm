; DESCRIPTION: Renders a cyan disk with center (277, 126) and radius 20.
; PLAN: r0=277(x), r1=126(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 126
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
