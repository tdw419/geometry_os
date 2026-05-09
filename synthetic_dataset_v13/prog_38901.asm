; DESCRIPTION: Renders a yellow box of size 50x46 starting at (315, 179).
; PLAN: r0=315(x), r1=179(y), r2=50(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 179
LDI r2, 50
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
