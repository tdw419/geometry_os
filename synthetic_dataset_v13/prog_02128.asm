; DESCRIPTION: Renders a white box of size 54x82 starting at (441, 14).
; PLAN: r0=441(x), r1=14(y), r2=54(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 14
LDI r2, 54
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
