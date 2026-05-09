; DESCRIPTION: Renders a yellow box of size 107x71 starting at (49, 164).
; PLAN: r0=49(x), r1=164(y), r2=107(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 164
LDI r2, 107
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
