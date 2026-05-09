; DESCRIPTION: Renders a red box of size 57x77 starting at (362, 151).
; PLAN: r0=362(x), r1=151(y), r2=57(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 151
LDI r2, 57
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
