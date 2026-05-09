; DESCRIPTION: Renders a white box of size 38x57 starting at (436, 52).
; PLAN: r0=436(x), r1=52(y), r2=38(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 52
LDI r2, 38
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
