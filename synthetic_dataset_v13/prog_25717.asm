; DESCRIPTION: Places a yellow 88x43 rectangle at position (313, 164).
; PLAN: r0=313(x), r1=164(y), r2=88(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 164
LDI r2, 88
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
