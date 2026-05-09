; DESCRIPTION: Places a cyan 106x68 rectangle at position (22, 86).
; PLAN: r0=22(x), r1=86(y), r2=106(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 86
LDI r2, 106
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
