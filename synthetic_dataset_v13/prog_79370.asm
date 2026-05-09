; DESCRIPTION: Renders a black box of size 27x86 starting at (57, 114).
; PLAN: r0=57(x), r1=114(y), r2=27(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 114
LDI r2, 27
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
