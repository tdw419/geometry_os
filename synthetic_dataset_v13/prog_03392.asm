; DESCRIPTION: Places a blue 59x63 rectangle at position (306, 0).
; PLAN: r0=306(x), r1=0(y), r2=59(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 0
LDI r2, 59
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
