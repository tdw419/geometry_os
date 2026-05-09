; DESCRIPTION: Draws a white rectangle at (333, 117) with width 32 and height 56.
; PLAN: r0=333(x), r1=117(y), r2=32(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 117
LDI r2, 32
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
