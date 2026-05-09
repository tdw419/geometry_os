; DESCRIPTION: Draws a red rectangle at (208, 144) with width 60 and height 42.
; PLAN: r0=208(x), r1=144(y), r2=60(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 144
LDI r2, 60
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
