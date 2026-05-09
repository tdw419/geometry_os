; DESCRIPTION: Places a white 52x117 rectangle at position (280, 80).
; PLAN: r0=280(x), r1=80(y), r2=52(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 80
LDI r2, 52
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
