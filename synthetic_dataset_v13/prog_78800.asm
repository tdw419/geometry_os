; DESCRIPTION: Renders a white box of size 57x77 starting at (366, 153).
; PLAN: r0=366(x), r1=153(y), r2=57(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 153
LDI r2, 57
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
