; DESCRIPTION: Renders a red box of size 71x54 starting at (208, 38).
; PLAN: r0=208(x), r1=38(y), r2=71(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 38
LDI r2, 71
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
