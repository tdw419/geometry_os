; DESCRIPTION: Renders a cyan box of size 116x26 starting at (383, 223).
; PLAN: r0=383(x), r1=223(y), r2=116(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 223
LDI r2, 116
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
