; DESCRIPTION: Renders a cyan box of size 35x116 starting at (75, 102).
; PLAN: r0=75(x), r1=102(y), r2=35(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 102
LDI r2, 35
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
