; DESCRIPTION: Renders a green disk with center (235, 74) and radius 50.
; PLAN: r0=235(x), r1=74(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 74
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
