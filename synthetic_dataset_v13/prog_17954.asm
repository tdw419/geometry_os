; DESCRIPTION: Renders a white box of size 30x29 starting at (315, 186).
; PLAN: r0=315(x), r1=186(y), r2=30(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 186
LDI r2, 30
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
