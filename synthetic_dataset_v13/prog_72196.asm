; DESCRIPTION: Renders a cyan box of size 25x52 starting at (407, 15).
; PLAN: r0=407(x), r1=15(y), r2=25(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 15
LDI r2, 25
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
