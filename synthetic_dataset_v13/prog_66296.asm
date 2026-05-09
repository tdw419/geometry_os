; DESCRIPTION: Renders a cyan box of size 102x14 starting at (55, 21).
; PLAN: r0=55(x), r1=21(y), r2=102(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 21
LDI r2, 102
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
