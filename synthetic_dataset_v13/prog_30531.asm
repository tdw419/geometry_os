; DESCRIPTION: Draws a white rectangle at (134, 197) with width 44 and height 46.
; PLAN: r0=134(x), r1=197(y), r2=44(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 197
LDI r2, 44
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
