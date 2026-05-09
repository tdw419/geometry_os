; DESCRIPTION: Renders a white box of size 20x52 starting at (332, 164).
; PLAN: r0=332(x), r1=164(y), r2=20(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 164
LDI r2, 20
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
