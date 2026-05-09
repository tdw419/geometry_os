; DESCRIPTION: Places a white 10x117 rectangle at position (229, 35).
; PLAN: r0=229(x), r1=35(y), r2=10(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 35
LDI r2, 10
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
