; DESCRIPTION: Renders a cyan box of size 100x100 starting at (376, 48).
; PLAN: r0=376(x), r1=48(y), r2=100(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 48
LDI r2, 100
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
