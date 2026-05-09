; DESCRIPTION: Places a green 88x19 rectangle at position (59, 34).
; PLAN: r0=59(x), r1=34(y), r2=88(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 34
LDI r2, 88
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
