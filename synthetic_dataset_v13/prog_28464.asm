; DESCRIPTION: Renders a red box of size 111x50 starting at (8, 34).
; PLAN: r0=8(x), r1=34(y), r2=111(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 34
LDI r2, 111
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
