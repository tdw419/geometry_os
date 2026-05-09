; DESCRIPTION: Creates a cyan circular shape at (235, 59) with radius 47.
; PLAN: r0=235(x), r1=59(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 59
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
