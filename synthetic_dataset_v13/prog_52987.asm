; DESCRIPTION: Renders a black box of size 93x100 starting at (228, 46).
; PLAN: r0=228(x), r1=46(y), r2=93(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 46
LDI r2, 93
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
