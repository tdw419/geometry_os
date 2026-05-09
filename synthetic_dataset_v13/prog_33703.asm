; DESCRIPTION: Renders a white box of size 70x52 starting at (398, 72).
; PLAN: r0=398(x), r1=72(y), r2=70(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 72
LDI r2, 70
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
