; DESCRIPTION: Places a blue 46x15 rectangle at position (126, 127).
; PLAN: r0=126(x), r1=127(y), r2=46(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 127
LDI r2, 46
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
