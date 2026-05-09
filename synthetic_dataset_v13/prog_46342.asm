; DESCRIPTION: Places a red 109x23 rectangle at position (171, 123).
; PLAN: r0=171(x), r1=123(y), r2=109(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 123
LDI r2, 109
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
