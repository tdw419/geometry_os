; DESCRIPTION: Places a red 54x68 rectangle at position (222, 51).
; PLAN: r0=222(x), r1=51(y), r2=54(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 51
LDI r2, 54
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
