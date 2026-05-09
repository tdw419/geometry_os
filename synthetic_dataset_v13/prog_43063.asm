; DESCRIPTION: Renders a cyan box of size 112x23 starting at (73, 129).
; PLAN: r0=73(x), r1=129(y), r2=112(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 129
LDI r2, 112
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
