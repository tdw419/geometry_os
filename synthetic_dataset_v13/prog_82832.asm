; DESCRIPTION: Places a green 88x98 rectangle at position (156, 21).
; PLAN: r0=156(x), r1=21(y), r2=88(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 21
LDI r2, 88
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
