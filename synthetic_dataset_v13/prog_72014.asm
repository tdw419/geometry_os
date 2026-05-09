; DESCRIPTION: Renders a cyan box of size 65x102 starting at (129, 65).
; PLAN: r0=129(x), r1=65(y), r2=65(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 65
LDI r2, 65
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
