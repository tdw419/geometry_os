; DESCRIPTION: Places a white 79x87 rectangle at position (412, 54).
; PLAN: r0=412(x), r1=54(y), r2=79(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 54
LDI r2, 79
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
