; DESCRIPTION: Renders a black box of size 65x14 starting at (330, 117).
; PLAN: r0=330(x), r1=117(y), r2=65(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 117
LDI r2, 65
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
