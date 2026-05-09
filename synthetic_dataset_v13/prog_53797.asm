; DESCRIPTION: Places a cyan 69x84 rectangle at position (16, 99).
; PLAN: r0=16(x), r1=99(y), r2=69(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 99
LDI r2, 69
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
