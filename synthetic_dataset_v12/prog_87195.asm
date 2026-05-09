; DESCRIPTION: Draws a blue rectangle at (382, 73) with width 82 and height 42.
; PLAN: r0=382(x), r1=73(y), r2=82(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 73
LDI r2, 82
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
