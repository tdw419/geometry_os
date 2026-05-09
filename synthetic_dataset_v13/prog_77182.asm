; DESCRIPTION: Renders a cyan box of size 104x119 starting at (36, 58).
; PLAN: r0=36(x), r1=58(y), r2=104(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 58
LDI r2, 104
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
