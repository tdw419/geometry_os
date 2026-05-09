; DESCRIPTION: Places a red 96x68 rectangle at position (250, 21).
; PLAN: r0=250(x), r1=21(y), r2=96(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 21
LDI r2, 96
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
