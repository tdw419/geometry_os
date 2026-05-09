; DESCRIPTION: Draws a white rectangle at (368, 134) with width 120 and height 104.
; PLAN: r0=368(x), r1=134(y), r2=120(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 134
LDI r2, 120
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
