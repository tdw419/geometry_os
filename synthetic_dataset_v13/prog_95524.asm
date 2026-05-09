; DESCRIPTION: Places a green 113x63 rectangle at position (10, 144).
; PLAN: r0=10(x), r1=144(y), r2=113(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 144
LDI r2, 113
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
