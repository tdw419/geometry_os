; DESCRIPTION: Renders a white box of size 118x20 starting at (32, 235).
; PLAN: r0=32(x), r1=235(y), r2=118(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 235
LDI r2, 118
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
