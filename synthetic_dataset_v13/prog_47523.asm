; DESCRIPTION: Renders a yellow box of size 70x76 starting at (66, 180).
; PLAN: r0=66(x), r1=180(y), r2=70(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 180
LDI r2, 70
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
