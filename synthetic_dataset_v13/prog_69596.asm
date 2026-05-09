; DESCRIPTION: Places a green 106x102 rectangle at position (179, 4).
; PLAN: r0=179(x), r1=4(y), r2=106(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 4
LDI r2, 106
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
