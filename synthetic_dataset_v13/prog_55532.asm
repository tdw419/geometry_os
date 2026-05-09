; DESCRIPTION: Renders a red box of size 102x31 starting at (103, 45).
; PLAN: r0=103(x), r1=45(y), r2=102(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 45
LDI r2, 102
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
