; DESCRIPTION: Places a red 41x77 rectangle at position (309, 145).
; PLAN: r0=309(x), r1=145(y), r2=41(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 145
LDI r2, 41
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
