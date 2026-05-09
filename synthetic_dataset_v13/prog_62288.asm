; DESCRIPTION: Places a blue 72x40 rectangle at position (166, 164).
; PLAN: r0=166(x), r1=164(y), r2=72(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 164
LDI r2, 72
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
