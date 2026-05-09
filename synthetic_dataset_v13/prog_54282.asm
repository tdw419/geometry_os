; DESCRIPTION: Draws a white rectangle at (90, 197) with width 29 and height 27.
; PLAN: r0=90(x), r1=197(y), r2=29(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 197
LDI r2, 29
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
