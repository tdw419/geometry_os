; DESCRIPTION: Places a red 32x99 rectangle at position (383, 23).
; PLAN: r0=383(x), r1=23(y), r2=32(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 23
LDI r2, 32
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
