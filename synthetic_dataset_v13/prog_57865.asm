; DESCRIPTION: Places a blue 58x12 rectangle at position (375, 146).
; PLAN: r0=375(x), r1=146(y), r2=58(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 146
LDI r2, 58
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
