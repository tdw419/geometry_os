; DESCRIPTION: Renders a black box of size 44x53 starting at (206, 12).
; PLAN: r0=206(x), r1=12(y), r2=44(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 12
LDI r2, 44
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
