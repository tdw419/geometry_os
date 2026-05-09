; DESCRIPTION: Places a cyan 63x10 rectangle at position (16, 158).
; PLAN: r0=16(x), r1=158(y), r2=63(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 158
LDI r2, 63
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
