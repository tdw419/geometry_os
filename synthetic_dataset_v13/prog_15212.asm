; DESCRIPTION: Renders a cyan box of size 73x116 starting at (227, 1).
; PLAN: r0=227(x), r1=1(y), r2=73(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 1
LDI r2, 73
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
