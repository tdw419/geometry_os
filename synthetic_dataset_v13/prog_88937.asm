; DESCRIPTION: Places a blue 112x39 rectangle at position (109, 57).
; PLAN: r0=109(x), r1=57(y), r2=112(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 57
LDI r2, 112
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
