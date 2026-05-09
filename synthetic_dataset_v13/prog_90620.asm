; DESCRIPTION: Renders a white box of size 44x95 starting at (468, 1).
; PLAN: r0=468(x), r1=1(y), r2=44(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 1
LDI r2, 44
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
