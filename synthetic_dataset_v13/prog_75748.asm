; DESCRIPTION: Renders a red box of size 10x63 starting at (271, 171).
; PLAN: r0=271(x), r1=171(y), r2=10(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 171
LDI r2, 10
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
