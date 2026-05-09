; DESCRIPTION: Places a green 86x99 rectangle at position (135, 41).
; PLAN: r0=135(x), r1=41(y), r2=86(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 41
LDI r2, 86
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
