; DESCRIPTION: Places a green 109x116 rectangle at position (176, 131).
; PLAN: r0=176(x), r1=131(y), r2=109(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 131
LDI r2, 109
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
