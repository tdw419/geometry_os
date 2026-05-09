; DESCRIPTION: Places a green 36x49 rectangle at position (365, 84).
; PLAN: r0=365(x), r1=84(y), r2=36(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 84
LDI r2, 36
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
