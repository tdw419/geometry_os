; DESCRIPTION: Places a red 22x58 rectangle at position (249, 113).
; PLAN: r0=249(x), r1=113(y), r2=22(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 113
LDI r2, 22
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
