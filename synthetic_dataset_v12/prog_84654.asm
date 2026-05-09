; DESCRIPTION: Renders a cyan box of size 88x109 starting at (208, 58).
; PLAN: r0=208(x), r1=58(y), r2=88(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 58
LDI r2, 88
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
