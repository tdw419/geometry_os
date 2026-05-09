; DESCRIPTION: Renders a white box of size 18x83 starting at (410, 121).
; PLAN: r0=410(x), r1=121(y), r2=18(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 121
LDI r2, 18
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
