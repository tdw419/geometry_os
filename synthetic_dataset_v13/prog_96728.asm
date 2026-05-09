; DESCRIPTION: Renders a cyan box of size 53x99 starting at (233, 22).
; PLAN: r0=233(x), r1=22(y), r2=53(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 22
LDI r2, 53
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
