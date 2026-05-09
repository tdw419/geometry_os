; DESCRIPTION: Draws a white rectangle at (215, 125) with width 91 and height 68.
; PLAN: r0=215(x), r1=125(y), r2=91(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 125
LDI r2, 91
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
