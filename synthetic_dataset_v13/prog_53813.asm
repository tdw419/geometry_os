; DESCRIPTION: Places a red 22x91 rectangle at position (51, 144).
; PLAN: r0=51(x), r1=144(y), r2=22(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 144
LDI r2, 22
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
