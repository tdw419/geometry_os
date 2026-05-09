; DESCRIPTION: Renders a cyan box of size 79x105 starting at (353, 17).
; PLAN: r0=353(x), r1=17(y), r2=79(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 17
LDI r2, 79
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
