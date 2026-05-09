; DESCRIPTION: Renders a cyan box of size 81x71 starting at (211, 138).
; PLAN: r0=211(x), r1=138(y), r2=81(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 138
LDI r2, 81
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
