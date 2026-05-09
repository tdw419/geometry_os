; DESCRIPTION: Renders a red box of size 94x58 starting at (411, 184).
; PLAN: r0=411(x), r1=184(y), r2=94(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 184
LDI r2, 94
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
