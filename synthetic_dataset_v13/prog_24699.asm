; DESCRIPTION: Renders a black box of size 33x10 starting at (58, 164).
; PLAN: r0=58(x), r1=164(y), r2=33(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 164
LDI r2, 33
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
