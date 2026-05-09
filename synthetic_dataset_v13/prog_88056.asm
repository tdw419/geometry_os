; DESCRIPTION: Renders a cyan box of size 61x20 starting at (427, 201).
; PLAN: r0=427(x), r1=201(y), r2=61(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 201
LDI r2, 61
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
