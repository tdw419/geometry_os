; DESCRIPTION: Renders a white box of size 31x112 starting at (330, 19).
; PLAN: r0=330(x), r1=19(y), r2=31(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 19
LDI r2, 31
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
