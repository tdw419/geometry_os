; DESCRIPTION: Renders a black box of size 120x20 starting at (25, 187).
; PLAN: r0=25(x), r1=187(y), r2=120(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 187
LDI r2, 120
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
