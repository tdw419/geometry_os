; DESCRIPTION: Renders a cyan box of size 77x20 starting at (239, 18).
; PLAN: r0=239(x), r1=18(y), r2=77(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 18
LDI r2, 77
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
