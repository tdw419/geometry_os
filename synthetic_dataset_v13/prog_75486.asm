; DESCRIPTION: Renders a white box of size 59x54 starting at (73, 77).
; PLAN: r0=73(x), r1=77(y), r2=59(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 77
LDI r2, 59
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
