; DESCRIPTION: Places a blue 87x68 rectangle at position (130, 167).
; PLAN: r0=130(x), r1=167(y), r2=87(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 167
LDI r2, 87
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
