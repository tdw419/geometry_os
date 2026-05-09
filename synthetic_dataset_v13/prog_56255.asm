; DESCRIPTION: Renders a cyan box of size 43x101 starting at (394, 129).
; PLAN: r0=394(x), r1=129(y), r2=43(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 129
LDI r2, 43
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
