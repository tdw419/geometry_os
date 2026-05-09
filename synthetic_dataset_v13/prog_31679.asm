; DESCRIPTION: Renders a white box of size 44x48 starting at (233, 149).
; PLAN: r0=233(x), r1=149(y), r2=44(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 149
LDI r2, 44
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
