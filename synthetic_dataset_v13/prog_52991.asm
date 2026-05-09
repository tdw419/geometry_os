; DESCRIPTION: Renders a black box of size 110x31 starting at (110, 187).
; PLAN: r0=110(x), r1=187(y), r2=110(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 187
LDI r2, 110
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
