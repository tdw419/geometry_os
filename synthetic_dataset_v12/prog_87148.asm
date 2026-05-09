; DESCRIPTION: Renders a red box of size 120x46 starting at (306, 55).
; PLAN: r0=306(x), r1=55(y), r2=120(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 55
LDI r2, 120
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
