; DESCRIPTION: Places a cyan 106x35 rectangle at position (162, 66).
; PLAN: r0=162(x), r1=66(y), r2=106(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 66
LDI r2, 106
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
