; DESCRIPTION: Draws a blue rectangle at (330, 47) with width 42 and height 89.
; PLAN: r0=330(x), r1=47(y), r2=42(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 47
LDI r2, 42
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
