; DESCRIPTION: Renders a red box of size 78x48 starting at (408, 142).
; PLAN: r0=408(x), r1=142(y), r2=78(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 142
LDI r2, 78
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
