; DESCRIPTION: Draws a green rectangle at (168, 208) with width 72 and height 42.
; PLAN: r0=168(x), r1=208(y), r2=72(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 208
LDI r2, 72
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
