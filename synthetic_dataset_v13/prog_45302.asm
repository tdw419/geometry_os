; DESCRIPTION: Renders a red box of size 95x111 starting at (369, 87).
; PLAN: r0=369(x), r1=87(y), r2=95(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 87
LDI r2, 95
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
