; DESCRIPTION: Renders a cyan box of size 37x83 starting at (31, 169).
; PLAN: r0=31(x), r1=169(y), r2=37(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 169
LDI r2, 37
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
