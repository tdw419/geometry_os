; DESCRIPTION: Renders a cyan box of size 58x98 starting at (182, 131).
; PLAN: r0=182(x), r1=131(y), r2=58(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 131
LDI r2, 58
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
