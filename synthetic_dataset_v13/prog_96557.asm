; DESCRIPTION: Renders a white box of size 90x94 starting at (251, 35).
; PLAN: r0=251(x), r1=35(y), r2=90(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 35
LDI r2, 90
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
