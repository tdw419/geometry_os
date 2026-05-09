; DESCRIPTION: Renders a cyan box of size 54x52 starting at (18, 135).
; PLAN: r0=18(x), r1=135(y), r2=54(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 135
LDI r2, 54
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
