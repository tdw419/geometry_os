; DESCRIPTION: Renders a cyan box of size 102x34 starting at (323, 199).
; PLAN: r0=323(x), r1=199(y), r2=102(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 199
LDI r2, 102
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
