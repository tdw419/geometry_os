; DESCRIPTION: Places a black 86x52 rectangle at position (188, 85).
; PLAN: r0=188(x), r1=85(y), r2=86(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 85
LDI r2, 86
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
