; DESCRIPTION: Places a black 75x59 rectangle at position (288, 79).
; PLAN: r0=288(x), r1=79(y), r2=75(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 79
LDI r2, 75
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
