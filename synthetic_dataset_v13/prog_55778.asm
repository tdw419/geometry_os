; DESCRIPTION: Places a blue 113x107 rectangle at position (156, 16).
; PLAN: r0=156(x), r1=16(y), r2=113(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 16
LDI r2, 113
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
