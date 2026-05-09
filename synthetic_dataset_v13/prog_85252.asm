; DESCRIPTION: Places a green 106x118 rectangle at position (105, 91).
; PLAN: r0=105(x), r1=91(y), r2=106(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 91
LDI r2, 106
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
