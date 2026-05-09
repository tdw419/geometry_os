; DESCRIPTION: Renders a black box of size 24x76 starting at (243, 142).
; PLAN: r0=243(x), r1=142(y), r2=24(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 142
LDI r2, 24
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
