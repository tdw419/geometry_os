; DESCRIPTION: Renders a orange box of size 31x44 starting at (336, 140).
; PLAN: r0=336(x), r1=140(y), r2=31(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 140
LDI r2, 31
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
