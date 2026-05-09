; DESCRIPTION: Renders a red box of size 50x22 starting at (240, 68).
; PLAN: r0=240(x), r1=68(y), r2=50(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 68
LDI r2, 50
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
