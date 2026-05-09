; DESCRIPTION: Places a blue 86x99 rectangle at position (281, 78).
; PLAN: r0=281(x), r1=78(y), r2=86(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 78
LDI r2, 86
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
