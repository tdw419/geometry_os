; DESCRIPTION: Renders a cyan box of size 46x88 starting at (172, 36).
; PLAN: r0=172(x), r1=36(y), r2=46(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 36
LDI r2, 46
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
