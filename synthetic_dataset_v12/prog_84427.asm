; DESCRIPTION: Places a blue 38x112 rectangle at position (270, 130).
; PLAN: r0=270(x), r1=130(y), r2=38(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 130
LDI r2, 38
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
