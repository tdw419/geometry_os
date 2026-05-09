; DESCRIPTION: Places a green 84x103 rectangle at position (73, 6).
; PLAN: r0=73(x), r1=6(y), r2=84(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 6
LDI r2, 84
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
