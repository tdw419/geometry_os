; DESCRIPTION: Renders a cyan box of size 19x98 starting at (373, 64).
; PLAN: r0=373(x), r1=64(y), r2=19(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 64
LDI r2, 19
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
