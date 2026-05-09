; DESCRIPTION: Renders a green box of size 113x15 starting at (1, 187).
; PLAN: r0=1(x), r1=187(y), r2=113(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 187
LDI r2, 113
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
