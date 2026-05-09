; DESCRIPTION: Renders a green box of size 113x82 starting at (88, 46).
; PLAN: r0=88(x), r1=46(y), r2=113(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 46
LDI r2, 113
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
