; DESCRIPTION: Renders a cyan box of size 116x31 starting at (325, 172).
; PLAN: r0=325(x), r1=172(y), r2=116(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 172
LDI r2, 116
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
