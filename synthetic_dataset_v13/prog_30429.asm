; DESCRIPTION: Renders a black box of size 15x86 starting at (193, 129).
; PLAN: r0=193(x), r1=129(y), r2=15(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 129
LDI r2, 15
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
