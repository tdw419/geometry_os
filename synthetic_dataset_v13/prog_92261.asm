; DESCRIPTION: Draws a white rectangle at (365, 18) with width 86 and height 98.
; PLAN: r0=365(x), r1=18(y), r2=86(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 18
LDI r2, 86
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
