; DESCRIPTION: Renders a green box of size 28x49 starting at (443, 206).
; PLAN: r0=443(x), r1=206(y), r2=28(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 206
LDI r2, 28
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
