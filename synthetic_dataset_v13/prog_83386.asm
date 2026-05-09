; DESCRIPTION: Renders a red box of size 94x44 starting at (299, 136).
; PLAN: r0=299(x), r1=136(y), r2=94(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 136
LDI r2, 94
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
