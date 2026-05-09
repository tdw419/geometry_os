; DESCRIPTION: Renders a cyan box of size 61x98 starting at (241, 137).
; PLAN: r0=241(x), r1=137(y), r2=61(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 137
LDI r2, 61
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
