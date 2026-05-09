; DESCRIPTION: Renders a black box of size 82x117 starting at (33, 38).
; PLAN: r0=33(x), r1=38(y), r2=82(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 38
LDI r2, 82
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
