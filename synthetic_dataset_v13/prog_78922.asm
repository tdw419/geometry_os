; DESCRIPTION: Renders a cyan disk with center (277, 188) and radius 60.
; PLAN: r0=277(x), r1=188(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 188
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
