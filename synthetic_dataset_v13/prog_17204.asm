; DESCRIPTION: Places a blue 88x34 rectangle at position (363, 92).
; PLAN: r0=363(x), r1=92(y), r2=88(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 92
LDI r2, 88
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
