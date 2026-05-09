; DESCRIPTION: Renders a black box of size 75x54 starting at (38, 77).
; PLAN: r0=38(x), r1=77(y), r2=75(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 77
LDI r2, 75
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
