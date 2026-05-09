; DESCRIPTION: Renders a black box of size 58x86 starting at (111, 21).
; PLAN: r0=111(x), r1=21(y), r2=58(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 21
LDI r2, 58
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
