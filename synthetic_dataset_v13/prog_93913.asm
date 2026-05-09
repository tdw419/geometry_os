; DESCRIPTION: Draws a white rectangle at (81, 197) with width 91 and height 16.
; PLAN: r0=81(x), r1=197(y), r2=91(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 197
LDI r2, 91
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
