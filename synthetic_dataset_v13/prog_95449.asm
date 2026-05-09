; DESCRIPTION: Renders a cyan box of size 110x61 starting at (241, 183).
; PLAN: r0=241(x), r1=183(y), r2=110(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 183
LDI r2, 110
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
