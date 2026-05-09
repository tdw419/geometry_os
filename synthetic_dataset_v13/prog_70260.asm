; DESCRIPTION: Places a red 83x96 rectangle at position (167, 35).
; PLAN: r0=167(x), r1=35(y), r2=83(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 35
LDI r2, 83
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
