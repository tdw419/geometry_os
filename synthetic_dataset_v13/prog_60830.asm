; DESCRIPTION: Renders a cyan box of size 91x21 starting at (236, 151).
; PLAN: r0=236(x), r1=151(y), r2=91(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 151
LDI r2, 91
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
