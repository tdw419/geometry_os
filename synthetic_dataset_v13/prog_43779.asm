; DESCRIPTION: Places a red 65x68 rectangle at position (437, 171).
; PLAN: r0=437(x), r1=171(y), r2=65(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 171
LDI r2, 65
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
