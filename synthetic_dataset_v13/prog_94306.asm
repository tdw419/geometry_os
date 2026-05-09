; DESCRIPTION: Places a green 81x59 rectangle at position (291, 95).
; PLAN: r0=291(x), r1=95(y), r2=81(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 95
LDI r2, 81
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
