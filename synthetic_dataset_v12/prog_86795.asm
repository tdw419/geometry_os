; DESCRIPTION: Renders a red box of size 48x68 starting at (380, 1).
; PLAN: r0=380(x), r1=1(y), r2=48(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 1
LDI r2, 48
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
