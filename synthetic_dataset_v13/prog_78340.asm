; DESCRIPTION: Renders a white box of size 15x18 starting at (470, 235).
; PLAN: r0=470(x), r1=235(y), r2=15(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 235
LDI r2, 15
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
