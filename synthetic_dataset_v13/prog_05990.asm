; DESCRIPTION: Places a blue 25x86 rectangle at position (189, 24).
; PLAN: r0=189(x), r1=24(y), r2=25(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 24
LDI r2, 25
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
