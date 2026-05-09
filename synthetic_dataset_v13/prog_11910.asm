; DESCRIPTION: Renders a cyan box of size 104x88 starting at (43, 126).
; PLAN: r0=43(x), r1=126(y), r2=104(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 126
LDI r2, 104
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
