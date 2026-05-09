; DESCRIPTION: Places a red 72x68 rectangle at position (12, 162).
; PLAN: r0=12(x), r1=162(y), r2=72(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 162
LDI r2, 72
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
