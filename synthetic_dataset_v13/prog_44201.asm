; DESCRIPTION: Places a green 11x52 rectangle at position (154, 151).
; PLAN: r0=154(x), r1=151(y), r2=11(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 151
LDI r2, 11
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
