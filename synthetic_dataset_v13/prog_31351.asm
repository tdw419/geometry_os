; DESCRIPTION: Renders a red box of size 61x24 starting at (393, 65).
; PLAN: r0=393(x), r1=65(y), r2=61(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 65
LDI r2, 61
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
