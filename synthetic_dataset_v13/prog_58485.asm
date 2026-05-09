; DESCRIPTION: Places a red 88x16 rectangle at position (247, 59).
; PLAN: r0=247(x), r1=59(y), r2=88(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 59
LDI r2, 88
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
