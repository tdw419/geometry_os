; DESCRIPTION: Places a blue 120x34 rectangle at position (237, 58).
; PLAN: r0=237(x), r1=58(y), r2=120(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 58
LDI r2, 120
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
