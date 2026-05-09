; DESCRIPTION: Renders a cyan box of size 80x88 starting at (268, 92).
; PLAN: r0=268(x), r1=92(y), r2=80(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 92
LDI r2, 80
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
