; DESCRIPTION: Places a blue 26x58 rectangle at position (290, 189).
; PLAN: r0=290(x), r1=189(y), r2=26(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 189
LDI r2, 26
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
