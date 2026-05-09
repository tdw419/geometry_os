; DESCRIPTION: Places a white 36x68 rectangle at position (169, 181).
; PLAN: r0=169(x), r1=181(y), r2=36(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 181
LDI r2, 36
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
