; DESCRIPTION: Renders a white box of size 65x61 starting at (29, 37).
; PLAN: r0=29(x), r1=37(y), r2=65(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 37
LDI r2, 65
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
