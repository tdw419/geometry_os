; DESCRIPTION: Places a yellow 86x57 rectangle at position (64, 33).
; PLAN: r0=64(x), r1=33(y), r2=86(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 33
LDI r2, 86
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
