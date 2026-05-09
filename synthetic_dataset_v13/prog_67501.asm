; DESCRIPTION: Renders a red box of size 24x24 starting at (152, 226).
; PLAN: r0=152(x), r1=226(y), r2=24(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 226
LDI r2, 24
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
