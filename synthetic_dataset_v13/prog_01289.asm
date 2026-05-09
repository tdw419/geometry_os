; DESCRIPTION: Renders a white box of size 100x109 starting at (370, 7).
; PLAN: r0=370(x), r1=7(y), r2=100(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 7
LDI r2, 100
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
