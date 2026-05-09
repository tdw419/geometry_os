; DESCRIPTION: Draws a white rectangle at (372, 109) with width 117 and height 57.
; PLAN: r0=372(x), r1=109(y), r2=117(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 109
LDI r2, 117
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
