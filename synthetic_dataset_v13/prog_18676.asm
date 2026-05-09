; DESCRIPTION: Renders a black box of size 79x113 starting at (50, 34).
; PLAN: r0=50(x), r1=34(y), r2=79(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 34
LDI r2, 79
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
