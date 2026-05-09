; DESCRIPTION: Places a red 107x107 rectangle at position (106, 140).
; PLAN: r0=106(x), r1=140(y), r2=107(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 140
LDI r2, 107
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
