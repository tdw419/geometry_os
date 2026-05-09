; DESCRIPTION: Renders a white box of size 98x82 starting at (68, 33).
; PLAN: r0=68(x), r1=33(y), r2=98(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 33
LDI r2, 98
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
