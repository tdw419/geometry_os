; DESCRIPTION: Renders a cyan box of size 49x90 starting at (316, 138).
; PLAN: r0=316(x), r1=138(y), r2=49(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 138
LDI r2, 49
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
