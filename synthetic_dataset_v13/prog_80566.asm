; DESCRIPTION: Renders a red box of size 89x107 starting at (277, 68).
; PLAN: r0=277(x), r1=68(y), r2=89(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 68
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
