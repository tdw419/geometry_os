; DESCRIPTION: Renders a white box of size 25x55 starting at (193, 22).
; PLAN: r0=193(x), r1=22(y), r2=25(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 22
LDI r2, 25
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
