; DESCRIPTION: Places a green 15x86 rectangle at position (135, 63).
; PLAN: r0=135(x), r1=63(y), r2=15(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 63
LDI r2, 15
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
