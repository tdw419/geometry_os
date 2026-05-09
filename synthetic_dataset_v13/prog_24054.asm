; DESCRIPTION: Places a cyan 114x84 rectangle at position (3, 5).
; PLAN: r0=3(x), r1=5(y), r2=114(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 5
LDI r2, 114
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
