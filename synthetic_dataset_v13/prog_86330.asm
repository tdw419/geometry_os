; DESCRIPTION: Places a cyan 106x88 rectangle at position (162, 113).
; PLAN: r0=162(x), r1=113(y), r2=106(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 113
LDI r2, 106
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
