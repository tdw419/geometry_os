; DESCRIPTION: Draws a white rectangle at (142, 82) with width 93 and height 79.
; PLAN: r0=142(x), r1=82(y), r2=93(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 82
LDI r2, 93
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
