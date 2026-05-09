; DESCRIPTION: Renders a black box of size 71x16 starting at (354, 77).
; PLAN: r0=354(x), r1=77(y), r2=71(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 77
LDI r2, 71
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
