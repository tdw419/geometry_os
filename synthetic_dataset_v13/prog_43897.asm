; DESCRIPTION: Renders a cyan box of size 52x18 starting at (54, 163).
; PLAN: r0=54(x), r1=163(y), r2=52(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 163
LDI r2, 52
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
