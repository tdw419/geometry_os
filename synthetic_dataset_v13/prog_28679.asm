; DESCRIPTION: Renders a white box of size 47x99 starting at (102, 126).
; PLAN: r0=102(x), r1=126(y), r2=47(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 126
LDI r2, 47
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
