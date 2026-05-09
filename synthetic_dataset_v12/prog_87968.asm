; DESCRIPTION: Places a red 16x26 rectangle at position (90, 24).
; PLAN: r0=90(x), r1=24(y), r2=16(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 24
LDI r2, 16
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
