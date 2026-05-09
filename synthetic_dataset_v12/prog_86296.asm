; DESCRIPTION: Renders a black box of size 18x77 starting at (285, 176).
; PLAN: r0=285(x), r1=176(y), r2=18(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 176
LDI r2, 18
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
