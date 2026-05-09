; DESCRIPTION: Places a red 61x16 rectangle at position (24, 87).
; PLAN: r0=24(x), r1=87(y), r2=61(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 87
LDI r2, 61
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
