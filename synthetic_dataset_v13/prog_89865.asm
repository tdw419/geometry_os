; DESCRIPTION: Places a green 68x17 rectangle at position (86, 79).
; PLAN: r0=86(x), r1=79(y), r2=68(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 79
LDI r2, 68
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
