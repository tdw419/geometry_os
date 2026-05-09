; DESCRIPTION: Places a yellow 94x84 rectangle at position (234, 42).
; PLAN: r0=234(x), r1=42(y), r2=94(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 42
LDI r2, 94
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
