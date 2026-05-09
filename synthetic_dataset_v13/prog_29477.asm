; DESCRIPTION: Renders a white box of size 83x98 starting at (361, 57).
; PLAN: r0=361(x), r1=57(y), r2=83(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 57
LDI r2, 83
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
