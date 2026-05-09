; DESCRIPTION: Places a cyan 112x90 rectangle at position (4, 88).
; PLAN: r0=4(x), r1=88(y), r2=112(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 88
LDI r2, 112
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
