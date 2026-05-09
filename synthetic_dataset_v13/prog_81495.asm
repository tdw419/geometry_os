; DESCRIPTION: Places a black 28x78 rectangle at position (77, 95).
; PLAN: r0=77(x), r1=95(y), r2=28(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 95
LDI r2, 28
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
