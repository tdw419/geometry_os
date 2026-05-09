; DESCRIPTION: Places a black 99x24 rectangle at position (348, 46).
; PLAN: r0=348(x), r1=46(y), r2=99(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 46
LDI r2, 99
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
