; DESCRIPTION: Renders a black box of size 73x57 starting at (417, 157).
; PLAN: r0=417(x), r1=157(y), r2=73(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 157
LDI r2, 73
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
