; DESCRIPTION: Renders a green box of size 82x53 starting at (271, 119).
; PLAN: r0=271(x), r1=119(y), r2=82(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 119
LDI r2, 82
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
