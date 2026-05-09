; DESCRIPTION: Places a cyan circle of radius 56 at center (235, 57).
; PLAN: r0=235(x), r1=57(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 57
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
