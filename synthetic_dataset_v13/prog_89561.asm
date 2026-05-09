; DESCRIPTION: Draws a white rectangle at (386, 143) with width 61 and height 53.
; PLAN: r0=386(x), r1=143(y), r2=61(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 143
LDI r2, 61
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
