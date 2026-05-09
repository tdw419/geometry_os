; DESCRIPTION: Draws a white rectangle at (387, 46) with width 31 and height 89.
; PLAN: r0=387(x), r1=46(y), r2=31(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 46
LDI r2, 31
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
