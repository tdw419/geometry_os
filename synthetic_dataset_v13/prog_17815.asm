; DESCRIPTION: Renders a red box of size 113x71 starting at (307, 0).
; PLAN: r0=307(x), r1=0(y), r2=113(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 0
LDI r2, 113
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
