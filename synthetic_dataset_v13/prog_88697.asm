; DESCRIPTION: Places a green 96x81 rectangle at position (63, 134).
; PLAN: r0=63(x), r1=134(y), r2=96(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 134
LDI r2, 96
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
