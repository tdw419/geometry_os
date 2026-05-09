; DESCRIPTION: Places a blue 120x113 rectangle at position (24, 23).
; PLAN: r0=24(x), r1=23(y), r2=120(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 23
LDI r2, 120
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
