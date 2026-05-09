; DESCRIPTION: Renders a cyan box of size 52x77 starting at (282, 158).
; PLAN: r0=282(x), r1=158(y), r2=52(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 158
LDI r2, 52
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
