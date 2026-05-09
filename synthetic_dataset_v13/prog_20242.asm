; DESCRIPTION: Renders a black box of size 47x65 starting at (60, 20).
; PLAN: r0=60(x), r1=20(y), r2=47(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 20
LDI r2, 47
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
