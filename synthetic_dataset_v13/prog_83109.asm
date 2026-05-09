; DESCRIPTION: Renders a red box of size 45x117 starting at (178, 55).
; PLAN: r0=178(x), r1=55(y), r2=45(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 55
LDI r2, 45
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
