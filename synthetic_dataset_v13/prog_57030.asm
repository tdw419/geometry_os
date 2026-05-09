; DESCRIPTION: Draws a white rectangle at (290, 199) with width 40 and height 50.
; PLAN: r0=290(x), r1=199(y), r2=40(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 199
LDI r2, 40
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
