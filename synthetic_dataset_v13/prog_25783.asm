; DESCRIPTION: Renders a orange disk with center (479, 235) and radius 15.
; PLAN: r0=479(x), r1=235(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 235
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
