; DESCRIPTION: Places a cyan 25x101 rectangle at position (111, 100).
; PLAN: r0=111(x), r1=100(y), r2=25(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 100
LDI r2, 25
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
