; DESCRIPTION: Renders a white box of size 31x32 starting at (70, 102).
; PLAN: r0=70(x), r1=102(y), r2=31(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 102
LDI r2, 31
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
