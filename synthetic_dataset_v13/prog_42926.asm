; DESCRIPTION: Renders a blue box of size 96x77 starting at (187, 73).
; PLAN: r0=187(x), r1=73(y), r2=96(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 73
LDI r2, 96
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
