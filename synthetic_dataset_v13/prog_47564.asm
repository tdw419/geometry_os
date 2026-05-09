; DESCRIPTION: Renders a white box of size 119x35 starting at (198, 175).
; PLAN: r0=198(x), r1=175(y), r2=119(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 175
LDI r2, 119
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
