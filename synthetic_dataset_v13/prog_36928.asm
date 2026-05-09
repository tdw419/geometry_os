; DESCRIPTION: Places a yellow 36x32 rectangle at position (70, 122).
; PLAN: r0=70(x), r1=122(y), r2=36(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 122
LDI r2, 36
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
