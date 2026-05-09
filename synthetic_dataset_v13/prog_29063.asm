; DESCRIPTION: Renders a white box of size 12x28 starting at (307, 77).
; PLAN: r0=307(x), r1=77(y), r2=12(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 77
LDI r2, 12
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
