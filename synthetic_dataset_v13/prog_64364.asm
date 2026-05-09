; DESCRIPTION: Places a blue 110x91 rectangle at position (48, 41).
; PLAN: r0=48(x), r1=41(y), r2=110(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 41
LDI r2, 110
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
