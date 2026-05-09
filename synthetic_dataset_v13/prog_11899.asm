; DESCRIPTION: Renders a red box of size 48x18 starting at (132, 103).
; PLAN: r0=132(x), r1=103(y), r2=48(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 103
LDI r2, 48
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
