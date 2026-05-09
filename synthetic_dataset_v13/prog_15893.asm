; DESCRIPTION: Places a green 115x56 rectangle at position (191, 57).
; PLAN: r0=191(x), r1=57(y), r2=115(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 57
LDI r2, 115
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
