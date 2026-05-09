; DESCRIPTION: Places a black 28x102 rectangle at position (279, 77).
; PLAN: r0=279(x), r1=77(y), r2=28(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 77
LDI r2, 28
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
