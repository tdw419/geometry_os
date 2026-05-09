; DESCRIPTION: Renders a white box of size 87x29 starting at (29, 221).
; PLAN: r0=29(x), r1=221(y), r2=87(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 221
LDI r2, 87
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
