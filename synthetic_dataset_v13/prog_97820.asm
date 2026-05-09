; DESCRIPTION: Places a red 73x107 rectangle at position (225, 138).
; PLAN: r0=225(x), r1=138(y), r2=73(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 138
LDI r2, 73
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
