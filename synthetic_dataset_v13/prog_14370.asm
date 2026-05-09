; DESCRIPTION: Places a green 63x23 rectangle at position (398, 161).
; PLAN: r0=398(x), r1=161(y), r2=63(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 161
LDI r2, 63
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
