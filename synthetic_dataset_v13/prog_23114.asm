; DESCRIPTION: Renders a cyan box of size 81x23 starting at (65, 233).
; PLAN: r0=65(x), r1=233(y), r2=81(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 233
LDI r2, 81
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
