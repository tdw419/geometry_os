; DESCRIPTION: Places a red 68x31 rectangle at position (383, 7).
; PLAN: r0=383(x), r1=7(y), r2=68(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 7
LDI r2, 68
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
