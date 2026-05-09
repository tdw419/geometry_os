; DESCRIPTION: Renders a cyan box of size 76x22 starting at (212, 61).
; PLAN: r0=212(x), r1=61(y), r2=76(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 61
LDI r2, 76
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
