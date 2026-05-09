; DESCRIPTION: Renders a red box of size 36x44 starting at (43, 152).
; PLAN: r0=43(x), r1=152(y), r2=36(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 152
LDI r2, 36
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
