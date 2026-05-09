; DESCRIPTION: Places a yellow 88x64 rectangle at position (10, 21).
; PLAN: r0=10(x), r1=21(y), r2=88(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 21
LDI r2, 88
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
