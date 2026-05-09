; DESCRIPTION: Renders a cyan box of size 109x14 starting at (86, 189).
; PLAN: r0=86(x), r1=189(y), r2=109(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 189
LDI r2, 109
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
