; DESCRIPTION: Draws a white rectangle at (315, 228) with width 92 and height 20.
; PLAN: r0=315(x), r1=228(y), r2=92(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 228
LDI r2, 92
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
