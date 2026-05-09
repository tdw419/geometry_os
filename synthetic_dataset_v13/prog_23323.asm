; DESCRIPTION: Draws a white rectangle at (202, 20) with width 117 and height 85.
; PLAN: r0=202(x), r1=20(y), r2=117(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 20
LDI r2, 117
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
