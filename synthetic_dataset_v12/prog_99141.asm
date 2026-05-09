; DESCRIPTION: Renders a cyan disk with center (303, 151) and radius 50.
; PLAN: r0=303(x), r1=151(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 151
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
