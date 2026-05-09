; DESCRIPTION: Renders a cyan box of size 115x52 starting at (234, 3).
; PLAN: r0=234(x), r1=3(y), r2=115(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 3
LDI r2, 115
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
