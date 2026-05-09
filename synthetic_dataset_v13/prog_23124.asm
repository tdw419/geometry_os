; DESCRIPTION: Places a green 109x58 rectangle at position (73, 49).
; PLAN: r0=73(x), r1=49(y), r2=109(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 49
LDI r2, 109
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
