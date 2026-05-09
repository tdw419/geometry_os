; DESCRIPTION: Renders a cyan box of size 116x108 starting at (114, 144).
; PLAN: r0=114(x), r1=144(y), r2=116(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 144
LDI r2, 116
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
