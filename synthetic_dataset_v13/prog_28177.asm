; DESCRIPTION: Places a yellow 64x31 rectangle at position (70, 135).
; PLAN: r0=70(x), r1=135(y), r2=64(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 135
LDI r2, 64
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
