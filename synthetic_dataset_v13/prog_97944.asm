; DESCRIPTION: Renders a cyan box of size 88x84 starting at (203, 125).
; PLAN: r0=203(x), r1=125(y), r2=88(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 125
LDI r2, 88
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
