; DESCRIPTION: Renders a cyan box of size 93x46 starting at (211, 151).
; PLAN: r0=211(x), r1=151(y), r2=93(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 151
LDI r2, 93
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
