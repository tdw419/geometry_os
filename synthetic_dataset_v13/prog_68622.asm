; DESCRIPTION: Renders a green box of size 52x18 starting at (344, 125).
; PLAN: r0=344(x), r1=125(y), r2=52(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 125
LDI r2, 52
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
