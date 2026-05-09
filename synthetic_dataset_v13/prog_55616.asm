; DESCRIPTION: Places a white 79x68 rectangle at position (1, 50).
; PLAN: r0=1(x), r1=50(y), r2=79(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 50
LDI r2, 79
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
