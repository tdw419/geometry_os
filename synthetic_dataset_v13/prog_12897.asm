; DESCRIPTION: Renders a cyan disk with center (103, 144) and radius 54.
; PLAN: r0=103(x), r1=144(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 144
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
