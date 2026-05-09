; DESCRIPTION: Draws a white rectangle at (168, 179) with width 38 and height 24.
; PLAN: r0=168(x), r1=179(y), r2=38(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 179
LDI r2, 38
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
