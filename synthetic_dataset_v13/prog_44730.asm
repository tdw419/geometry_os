; DESCRIPTION: Places a yellow 19x59 rectangle at position (167, 62).
; PLAN: r0=167(x), r1=62(y), r2=19(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 62
LDI r2, 19
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
