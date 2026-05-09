; DESCRIPTION: Renders a cyan disk with center (198, 150) and radius 10.
; PLAN: r0=198(x), r1=150(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 150
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
