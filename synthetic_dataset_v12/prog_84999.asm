; DESCRIPTION: Renders a green box of size 90x82 starting at (72, 70).
; PLAN: r0=72(x), r1=70(y), r2=90(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 70
LDI r2, 90
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
