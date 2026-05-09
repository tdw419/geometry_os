; DESCRIPTION: Places a blue 62x109 rectangle at position (212, 134).
; PLAN: r0=212(x), r1=134(y), r2=62(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 134
LDI r2, 62
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
