; DESCRIPTION: Places a yellow 84x68 rectangle at position (70, 128).
; PLAN: r0=70(x), r1=128(y), r2=84(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 128
LDI r2, 84
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
