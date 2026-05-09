; DESCRIPTION: Renders a cyan box of size 46x81 starting at (383, 64).
; PLAN: r0=383(x), r1=64(y), r2=46(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 64
LDI r2, 46
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
