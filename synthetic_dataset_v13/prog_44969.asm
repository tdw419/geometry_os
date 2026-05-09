; DESCRIPTION: Renders a black box of size 107x55 starting at (75, 171).
; PLAN: r0=75(x), r1=171(y), r2=107(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 171
LDI r2, 107
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
