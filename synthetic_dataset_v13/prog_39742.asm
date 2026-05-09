; DESCRIPTION: Renders a cyan box of size 97x107 starting at (203, 51).
; PLAN: r0=203(x), r1=51(y), r2=97(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 51
LDI r2, 97
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
