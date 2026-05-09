; DESCRIPTION: Places a red 86x40 rectangle at position (8, 126).
; PLAN: r0=8(x), r1=126(y), r2=86(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 126
LDI r2, 86
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
