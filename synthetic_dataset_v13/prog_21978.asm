; DESCRIPTION: Renders a red box of size 94x77 starting at (208, 1).
; PLAN: r0=208(x), r1=1(y), r2=94(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 1
LDI r2, 94
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
