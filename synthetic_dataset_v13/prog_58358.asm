; DESCRIPTION: Draws a blue rectangle at (148, 98) with width 42 and height 107.
; PLAN: r0=148(x), r1=98(y), r2=42(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 98
LDI r2, 42
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
