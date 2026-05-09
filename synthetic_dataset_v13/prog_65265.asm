; DESCRIPTION: Places a green 22x23 rectangle at position (125, 47).
; PLAN: r0=125(x), r1=47(y), r2=22(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 47
LDI r2, 22
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
