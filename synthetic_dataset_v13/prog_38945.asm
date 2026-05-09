; DESCRIPTION: Places a red 44x105 rectangle at position (73, 9).
; PLAN: r0=73(x), r1=9(y), r2=44(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 9
LDI r2, 44
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
