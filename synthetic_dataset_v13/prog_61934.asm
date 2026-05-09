; DESCRIPTION: Renders a red box of size 36x47 starting at (123, 180).
; PLAN: r0=123(x), r1=180(y), r2=36(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 180
LDI r2, 36
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
