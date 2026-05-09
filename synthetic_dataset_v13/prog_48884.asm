; DESCRIPTION: Renders a red box of size 68x29 starting at (368, 144).
; PLAN: r0=368(x), r1=144(y), r2=68(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 144
LDI r2, 68
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
