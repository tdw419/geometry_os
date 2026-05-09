; DESCRIPTION: Places a blue 16x25 rectangle at position (453, 68).
; PLAN: r0=453(x), r1=68(y), r2=16(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 68
LDI r2, 16
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
