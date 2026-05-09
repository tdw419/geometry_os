; DESCRIPTION: Renders a red box of size 93x90 starting at (59, 46).
; PLAN: r0=59(x), r1=46(y), r2=93(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 46
LDI r2, 93
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
