; DESCRIPTION: Renders a white box of size 99x38 starting at (247, 172).
; PLAN: r0=247(x), r1=172(y), r2=99(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 172
LDI r2, 99
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
