; DESCRIPTION: Places a blue 109x43 rectangle at position (220, 50).
; PLAN: r0=220(x), r1=50(y), r2=109(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 50
LDI r2, 109
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
