; DESCRIPTION: Renders a red box of size 66x102 starting at (362, 144).
; PLAN: r0=362(x), r1=144(y), r2=66(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 144
LDI r2, 66
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
