; DESCRIPTION: Renders a black box of size 44x10 starting at (206, 110).
; PLAN: r0=206(x), r1=110(y), r2=44(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 110
LDI r2, 44
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
