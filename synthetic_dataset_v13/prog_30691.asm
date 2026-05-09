; DESCRIPTION: Renders a cyan box of size 81x112 starting at (126, 92).
; PLAN: r0=126(x), r1=92(y), r2=81(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 92
LDI r2, 81
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
