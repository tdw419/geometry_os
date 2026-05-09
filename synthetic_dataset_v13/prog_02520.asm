; DESCRIPTION: Renders a cyan box of size 92x92 starting at (287, 58).
; PLAN: r0=287(x), r1=58(y), r2=92(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 58
LDI r2, 92
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
