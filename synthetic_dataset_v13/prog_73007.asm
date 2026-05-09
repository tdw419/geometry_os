; DESCRIPTION: Renders a cyan box of size 22x18 starting at (28, 112).
; PLAN: r0=28(x), r1=112(y), r2=22(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 112
LDI r2, 22
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
