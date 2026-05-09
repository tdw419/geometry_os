; DESCRIPTION: Places a blue 120x29 rectangle at position (91, 40).
; PLAN: r0=91(x), r1=40(y), r2=120(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 40
LDI r2, 120
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
