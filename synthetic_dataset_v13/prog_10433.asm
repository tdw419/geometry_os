; DESCRIPTION: Places a green 115x86 rectangle at position (1, 136).
; PLAN: r0=1(x), r1=136(y), r2=115(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 136
LDI r2, 115
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
