; DESCRIPTION: Draws a white rectangle at (304, 223) with width 51 and height 10.
; PLAN: r0=304(x), r1=223(y), r2=51(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 223
LDI r2, 51
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
