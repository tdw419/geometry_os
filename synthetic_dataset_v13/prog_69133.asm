; DESCRIPTION: Renders a white box of size 60x56 starting at (295, 78).
; PLAN: r0=295(x), r1=78(y), r2=60(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 78
LDI r2, 60
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
