; DESCRIPTION: Places a green 14x105 rectangle at position (127, 36).
; PLAN: r0=127(x), r1=36(y), r2=14(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 36
LDI r2, 14
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
