; DESCRIPTION: Places a cyan 40x101 rectangle at position (307, 32).
; PLAN: r0=307(x), r1=32(y), r2=40(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 32
LDI r2, 40
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
