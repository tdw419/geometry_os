; DESCRIPTION: Renders a black box of size 90x115 starting at (91, 134).
; PLAN: r0=91(x), r1=134(y), r2=90(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 134
LDI r2, 90
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
