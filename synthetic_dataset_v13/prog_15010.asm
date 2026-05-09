; DESCRIPTION: Draws a white rectangle at (64, 134) with width 44 and height 27.
; PLAN: r0=64(x), r1=134(y), r2=44(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 134
LDI r2, 44
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
