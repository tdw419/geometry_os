; DESCRIPTION: Places a green 68x55 rectangle at position (79, 200).
; PLAN: r0=79(x), r1=200(y), r2=68(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 200
LDI r2, 68
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
