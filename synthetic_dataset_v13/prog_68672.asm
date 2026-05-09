; DESCRIPTION: Places a red 47x10 rectangle at position (229, 207).
; PLAN: r0=229(x), r1=207(y), r2=47(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 207
LDI r2, 47
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
