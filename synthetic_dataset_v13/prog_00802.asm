; DESCRIPTION: Places a green 89x102 rectangle at position (236, 63).
; PLAN: r0=236(x), r1=63(y), r2=89(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 63
LDI r2, 89
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
