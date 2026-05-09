; DESCRIPTION: Places a green 80x70 rectangle at position (63, 0).
; PLAN: r0=63(x), r1=0(y), r2=80(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 0
LDI r2, 80
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
