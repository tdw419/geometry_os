; DESCRIPTION: Places a blue 18x60 rectangle at position (164, 138).
; PLAN: r0=164(x), r1=138(y), r2=18(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 138
LDI r2, 18
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
