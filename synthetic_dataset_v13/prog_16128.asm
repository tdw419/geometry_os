; DESCRIPTION: Places a green 82x85 rectangle at position (236, 88).
; PLAN: r0=236(x), r1=88(y), r2=82(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 88
LDI r2, 82
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
