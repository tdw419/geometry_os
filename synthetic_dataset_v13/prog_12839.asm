; DESCRIPTION: Places a red 16x81 rectangle at position (4, 78).
; PLAN: r0=4(x), r1=78(y), r2=16(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 78
LDI r2, 16
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
