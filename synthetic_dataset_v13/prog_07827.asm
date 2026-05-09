; DESCRIPTION: Draws a white rectangle at (187, 21) with width 93 and height 27.
; PLAN: r0=187(x), r1=21(y), r2=93(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 21
LDI r2, 93
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
