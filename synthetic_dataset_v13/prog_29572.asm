; DESCRIPTION: Renders a red box of size 25x80 starting at (258, 127).
; PLAN: r0=258(x), r1=127(y), r2=25(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 127
LDI r2, 25
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
