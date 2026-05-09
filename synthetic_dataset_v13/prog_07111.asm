; DESCRIPTION: Renders a red box of size 22x15 starting at (237, 132).
; PLAN: r0=237(x), r1=132(y), r2=22(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 132
LDI r2, 22
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
