; DESCRIPTION: Places a yellow 64x120 rectangle at position (299, 84).
; PLAN: r0=299(x), r1=84(y), r2=64(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 84
LDI r2, 64
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
