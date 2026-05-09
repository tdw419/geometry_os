; DESCRIPTION: Places a blue 73x107 rectangle at position (168, 98).
; PLAN: r0=168(x), r1=98(y), r2=73(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 98
LDI r2, 73
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
