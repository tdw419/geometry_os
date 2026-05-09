; DESCRIPTION: Places a red 107x46 rectangle at position (161, 130).
; PLAN: r0=161(x), r1=130(y), r2=107(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 130
LDI r2, 107
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
