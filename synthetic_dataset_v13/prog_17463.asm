; DESCRIPTION: Places a green 81x65 rectangle at position (5, 189).
; PLAN: r0=5(x), r1=189(y), r2=81(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 189
LDI r2, 81
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
