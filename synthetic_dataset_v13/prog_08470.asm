; DESCRIPTION: Places a cyan 40x116 rectangle at position (440, 75).
; PLAN: r0=440(x), r1=75(y), r2=40(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 75
LDI r2, 40
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
