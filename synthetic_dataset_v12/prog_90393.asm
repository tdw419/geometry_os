; DESCRIPTION: Renders a cyan box of size 92x99 starting at (13, 151).
; PLAN: r0=13(x), r1=151(y), r2=92(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 151
LDI r2, 92
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
