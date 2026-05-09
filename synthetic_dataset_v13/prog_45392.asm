; DESCRIPTION: Places a blue 110x19 rectangle at position (235, 93).
; PLAN: r0=235(x), r1=93(y), r2=110(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 93
LDI r2, 110
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
