; DESCRIPTION: Renders a black box of size 42x94 starting at (68, 154).
; PLAN: r0=68(x), r1=154(y), r2=42(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 154
LDI r2, 42
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
