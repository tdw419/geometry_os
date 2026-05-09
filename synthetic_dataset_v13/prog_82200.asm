; DESCRIPTION: Places a cyan 104x118 rectangle at position (213, 88).
; PLAN: r0=213(x), r1=88(y), r2=104(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 88
LDI r2, 104
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
