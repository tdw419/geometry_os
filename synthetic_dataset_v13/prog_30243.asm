; DESCRIPTION: Draws a white rectangle at (187, 23) with width 93 and height 64.
; PLAN: r0=187(x), r1=23(y), r2=93(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 23
LDI r2, 93
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
