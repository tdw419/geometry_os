; DESCRIPTION: Draws a green rectangle at (337, 29) with width 42 and height 120.
; PLAN: r0=337(x), r1=29(y), r2=42(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 29
LDI r2, 42
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
