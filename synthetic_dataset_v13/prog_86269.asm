; DESCRIPTION: Renders a cyan box of size 37x101 starting at (92, 80).
; PLAN: r0=92(x), r1=80(y), r2=37(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 80
LDI r2, 37
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
