; DESCRIPTION: Places a green 22x78 rectangle at position (168, 156).
; PLAN: r0=168(x), r1=156(y), r2=22(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 156
LDI r2, 22
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
