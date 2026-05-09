; DESCRIPTION: Renders a cyan box of size 100x92 starting at (280, 12).
; PLAN: r0=280(x), r1=12(y), r2=100(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 12
LDI r2, 100
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
