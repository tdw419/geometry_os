; DESCRIPTION: Places a yellow 88x47 rectangle at position (263, 2).
; PLAN: r0=263(x), r1=2(y), r2=88(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 2
LDI r2, 88
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
