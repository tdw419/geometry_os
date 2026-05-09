; DESCRIPTION: Places a green 15x19 rectangle at position (103, 84).
; PLAN: r0=103(x), r1=84(y), r2=15(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 84
LDI r2, 15
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
