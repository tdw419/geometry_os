; DESCRIPTION: Renders a black box of size 61x57 starting at (304, 58).
; PLAN: r0=304(x), r1=58(y), r2=61(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 58
LDI r2, 61
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
