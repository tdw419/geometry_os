; DESCRIPTION: Renders a white box of size 94x44 starting at (175, 70).
; PLAN: r0=175(x), r1=70(y), r2=94(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 70
LDI r2, 94
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
