; DESCRIPTION: Renders a green box of size 11x82 starting at (57, 31).
; PLAN: r0=57(x), r1=31(y), r2=11(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 31
LDI r2, 11
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
