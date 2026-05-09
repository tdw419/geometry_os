; DESCRIPTION: Places a red 77x24 rectangle at position (6, 135).
; PLAN: r0=6(x), r1=135(y), r2=77(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 135
LDI r2, 77
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
