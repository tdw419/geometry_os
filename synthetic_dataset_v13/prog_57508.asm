; DESCRIPTION: Renders a red box of size 120x54 starting at (111, 70).
; PLAN: r0=111(x), r1=70(y), r2=120(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 70
LDI r2, 120
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
