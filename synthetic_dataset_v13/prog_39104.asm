; DESCRIPTION: Renders a black box of size 33x31 starting at (206, 205).
; PLAN: r0=206(x), r1=205(y), r2=33(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 205
LDI r2, 33
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
