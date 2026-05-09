; DESCRIPTION: Draws a white rectangle at (298, 96) with width 21 and height 103.
; PLAN: r0=298(x), r1=96(y), r2=21(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 96
LDI r2, 21
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
