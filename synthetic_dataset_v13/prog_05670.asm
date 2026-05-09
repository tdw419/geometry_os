; DESCRIPTION: Renders a cyan box of size 116x83 starting at (231, 166).
; PLAN: r0=231(x), r1=166(y), r2=116(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 166
LDI r2, 116
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
