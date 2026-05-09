; DESCRIPTION: Draws a white rectangle at (246, 124) with width 39 and height 42.
; PLAN: r0=246(x), r1=124(y), r2=39(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 124
LDI r2, 39
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
