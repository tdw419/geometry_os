; DESCRIPTION: Draws a black rectangle at (346, 133) with width 42 and height 65.
; PLAN: r0=346(x), r1=133(y), r2=42(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 133
LDI r2, 42
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
