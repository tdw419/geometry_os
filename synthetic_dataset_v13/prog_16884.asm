; DESCRIPTION: Renders a black box of size 82x46 starting at (353, 195).
; PLAN: r0=353(x), r1=195(y), r2=82(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 195
LDI r2, 82
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
