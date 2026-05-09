; DESCRIPTION: Places a blue 98x29 rectangle at position (167, 28).
; PLAN: r0=167(x), r1=28(y), r2=98(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 28
LDI r2, 98
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
