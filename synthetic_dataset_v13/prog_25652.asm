; DESCRIPTION: Places a green 92x92 rectangle at position (176, 162).
; PLAN: r0=176(x), r1=162(y), r2=92(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 162
LDI r2, 92
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
