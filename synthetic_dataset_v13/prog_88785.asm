; DESCRIPTION: Renders a cyan box of size 113x58 starting at (350, 151).
; PLAN: r0=350(x), r1=151(y), r2=113(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 151
LDI r2, 113
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
