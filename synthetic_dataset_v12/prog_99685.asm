; DESCRIPTION: Places a green 105x10 rectangle at position (63, 161).
; PLAN: r0=63(x), r1=161(y), r2=105(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 161
LDI r2, 105
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
