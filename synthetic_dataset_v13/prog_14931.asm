; DESCRIPTION: Places a green 63x91 rectangle at position (243, 45).
; PLAN: r0=243(x), r1=45(y), r2=63(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 45
LDI r2, 63
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
