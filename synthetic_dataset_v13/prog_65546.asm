; DESCRIPTION: Renders a red box of size 82x22 starting at (234, 207).
; PLAN: r0=234(x), r1=207(y), r2=82(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 207
LDI r2, 82
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
