; DESCRIPTION: Renders a black box of size 117x90 starting at (190, 70).
; PLAN: r0=190(x), r1=70(y), r2=117(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 70
LDI r2, 117
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
