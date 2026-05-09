; DESCRIPTION: Places a blue 98x11 rectangle at position (328, 58).
; PLAN: r0=328(x), r1=58(y), r2=98(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 58
LDI r2, 98
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
