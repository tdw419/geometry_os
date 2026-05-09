; DESCRIPTION: Draws a white rectangle at (262, 124) with width 74 and height 24.
; PLAN: r0=262(x), r1=124(y), r2=74(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 124
LDI r2, 74
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
