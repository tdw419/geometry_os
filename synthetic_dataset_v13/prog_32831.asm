; DESCRIPTION: Places a red 41x65 rectangle at position (174, 85).
; PLAN: r0=174(x), r1=85(y), r2=41(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 85
LDI r2, 41
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
