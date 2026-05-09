; DESCRIPTION: Places a green 79x99 rectangle at position (240, 76).
; PLAN: r0=240(x), r1=76(y), r2=79(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 76
LDI r2, 79
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
