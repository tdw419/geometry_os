; DESCRIPTION: Places a green 96x116 rectangle at position (268, 5).
; PLAN: r0=268(x), r1=5(y), r2=96(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 5
LDI r2, 96
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
