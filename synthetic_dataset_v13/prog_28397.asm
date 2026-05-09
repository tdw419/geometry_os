; DESCRIPTION: Places a green 63x91 rectangle at position (211, 86).
; PLAN: r0=211(x), r1=86(y), r2=63(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 86
LDI r2, 63
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
