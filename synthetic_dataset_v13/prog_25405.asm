; DESCRIPTION: Places a red 39x89 rectangle at position (290, 14).
; PLAN: r0=290(x), r1=14(y), r2=39(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 14
LDI r2, 39
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
