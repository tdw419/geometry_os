; DESCRIPTION: Renders a cyan box of size 74x32 starting at (165, 97).
; PLAN: r0=165(x), r1=97(y), r2=74(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 97
LDI r2, 74
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
