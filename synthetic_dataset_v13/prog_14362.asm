; DESCRIPTION: Places a green 109x116 rectangle at position (5, 83).
; PLAN: r0=5(x), r1=83(y), r2=109(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 83
LDI r2, 109
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
