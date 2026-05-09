; DESCRIPTION: Renders a cyan box of size 77x52 starting at (435, 199).
; PLAN: r0=435(x), r1=199(y), r2=77(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 199
LDI r2, 77
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
