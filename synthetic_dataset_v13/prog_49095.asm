; DESCRIPTION: Renders a cyan box of size 23x61 starting at (53, 156).
; PLAN: r0=53(x), r1=156(y), r2=23(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 156
LDI r2, 23
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
