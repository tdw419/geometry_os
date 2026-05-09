; DESCRIPTION: Renders a black box of size 57x94 starting at (236, 161).
; PLAN: r0=236(x), r1=161(y), r2=57(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 161
LDI r2, 57
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
