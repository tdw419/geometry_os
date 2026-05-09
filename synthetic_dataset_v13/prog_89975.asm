; DESCRIPTION: Renders a white box of size 115x73 starting at (315, 91).
; PLAN: r0=315(x), r1=91(y), r2=115(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 91
LDI r2, 115
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
