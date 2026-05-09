; DESCRIPTION: Renders a white box of size 61x57 starting at (330, 78).
; PLAN: r0=330(x), r1=78(y), r2=61(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 78
LDI r2, 61
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
