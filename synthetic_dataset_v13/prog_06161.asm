; DESCRIPTION: Renders a cyan box of size 92x88 starting at (108, 86).
; PLAN: r0=108(x), r1=86(y), r2=92(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 86
LDI r2, 92
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
