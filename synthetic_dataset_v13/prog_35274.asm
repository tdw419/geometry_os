; DESCRIPTION: Places a red 68x16 rectangle at position (206, 106).
; PLAN: r0=206(x), r1=106(y), r2=68(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 106
LDI r2, 68
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
