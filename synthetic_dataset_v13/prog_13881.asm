; DESCRIPTION: Places a green 46x56 rectangle at position (421, 89).
; PLAN: r0=421(x), r1=89(y), r2=46(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 89
LDI r2, 46
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
