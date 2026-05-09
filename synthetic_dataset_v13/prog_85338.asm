; DESCRIPTION: Renders a black box of size 46x16 starting at (355, 177).
; PLAN: r0=355(x), r1=177(y), r2=46(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 177
LDI r2, 46
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
