; DESCRIPTION: Renders a red box of size 14x46 starting at (441, 179).
; PLAN: r0=441(x), r1=179(y), r2=14(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 179
LDI r2, 14
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
