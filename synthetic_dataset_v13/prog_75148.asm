; DESCRIPTION: Places a red 54x22 rectangle at position (107, 214).
; PLAN: r0=107(x), r1=214(y), r2=54(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 214
LDI r2, 54
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
