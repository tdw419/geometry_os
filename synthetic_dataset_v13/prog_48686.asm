; DESCRIPTION: Renders a red box of size 36x68 starting at (240, 57).
; PLAN: r0=240(x), r1=57(y), r2=36(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 57
LDI r2, 36
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
