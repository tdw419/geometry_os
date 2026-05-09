; DESCRIPTION: Renders a red box of size 71x47 starting at (139, 195).
; PLAN: r0=139(x), r1=195(y), r2=71(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 195
LDI r2, 71
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
