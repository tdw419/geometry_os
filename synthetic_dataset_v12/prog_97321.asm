; DESCRIPTION: Renders a white box of size 35x48 starting at (370, 205).
; PLAN: r0=370(x), r1=205(y), r2=35(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 205
LDI r2, 35
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
