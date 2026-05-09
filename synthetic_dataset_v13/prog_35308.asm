; DESCRIPTION: Places a purple 102x77 rectangle at position (279, 157).
; PLAN: r0=279(x), r1=157(y), r2=102(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 157
LDI r2, 102
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
