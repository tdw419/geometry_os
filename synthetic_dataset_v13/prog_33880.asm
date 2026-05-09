; DESCRIPTION: Places a black 96x77 rectangle at position (39, 77).
; PLAN: r0=39(x), r1=77(y), r2=96(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 77
LDI r2, 96
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
