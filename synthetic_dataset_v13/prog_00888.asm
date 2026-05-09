; DESCRIPTION: Renders a red box of size 94x117 starting at (191, 98).
; PLAN: r0=191(x), r1=98(y), r2=94(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 98
LDI r2, 94
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
