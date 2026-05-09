; DESCRIPTION: Renders a black box of size 65x48 starting at (213, 31).
; PLAN: r0=213(x), r1=31(y), r2=65(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 31
LDI r2, 65
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
