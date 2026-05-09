; DESCRIPTION: Places a green 79x88 rectangle at position (59, 7).
; PLAN: r0=59(x), r1=7(y), r2=79(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 7
LDI r2, 79
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
