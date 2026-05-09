; DESCRIPTION: Places a cyan 70x79 rectangle at position (162, 175).
; PLAN: r0=162(x), r1=175(y), r2=70(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 175
LDI r2, 70
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
