; DESCRIPTION: Renders a white box of size 97x118 starting at (242, 125).
; PLAN: r0=242(x), r1=125(y), r2=97(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 125
LDI r2, 97
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
