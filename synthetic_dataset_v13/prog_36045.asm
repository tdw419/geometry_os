; DESCRIPTION: Draws a red rectangle at (412, 209) with width 18 and height 42.
; PLAN: r0=412(x), r1=209(y), r2=18(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 209
LDI r2, 18
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
