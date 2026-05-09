; DESCRIPTION: Places a black 96x120 rectangle at position (283, 43).
; PLAN: r0=283(x), r1=43(y), r2=96(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 43
LDI r2, 96
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
