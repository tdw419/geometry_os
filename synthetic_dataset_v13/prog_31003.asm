; DESCRIPTION: Places a green 82x58 rectangle at position (14, 189).
; PLAN: r0=14(x), r1=189(y), r2=82(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 189
LDI r2, 82
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
