; DESCRIPTION: Renders a white box of size 47x97 starting at (92, 66).
; PLAN: r0=92(x), r1=66(y), r2=47(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 66
LDI r2, 47
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
