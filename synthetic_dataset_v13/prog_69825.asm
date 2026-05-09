; DESCRIPTION: Draws a white rectangle at (384, 131) with width 41 and height 27.
; PLAN: r0=384(x), r1=131(y), r2=41(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 131
LDI r2, 41
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
