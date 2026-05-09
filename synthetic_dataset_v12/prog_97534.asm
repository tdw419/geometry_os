; DESCRIPTION: Renders a red box of size 28x31 starting at (279, 210).
; PLAN: r0=279(x), r1=210(y), r2=28(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 210
LDI r2, 28
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
