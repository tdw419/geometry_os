; DESCRIPTION: Places a black 90x77 rectangle at position (77, 10).
; PLAN: r0=77(x), r1=10(y), r2=90(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 10
LDI r2, 90
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
