; DESCRIPTION: Renders a cyan box of size 116x87 starting at (343, 8).
; PLAN: r0=343(x), r1=8(y), r2=116(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 8
LDI r2, 116
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
