; DESCRIPTION: Places a red 24x97 rectangle at position (46, 77).
; PLAN: r0=46(x), r1=77(y), r2=24(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 77
LDI r2, 24
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
