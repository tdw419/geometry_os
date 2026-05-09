; DESCRIPTION: Renders a white box of size 22x53 starting at (214, 33).
; PLAN: r0=214(x), r1=33(y), r2=22(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 33
LDI r2, 22
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
