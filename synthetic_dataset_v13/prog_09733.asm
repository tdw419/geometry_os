; DESCRIPTION: Renders a white box of size 86x38 starting at (37, 209).
; PLAN: r0=37(x), r1=209(y), r2=86(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 209
LDI r2, 86
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
