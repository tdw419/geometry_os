; DESCRIPTION: Renders a red box of size 68x106 starting at (362, 16).
; PLAN: r0=362(x), r1=16(y), r2=68(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 16
LDI r2, 68
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
