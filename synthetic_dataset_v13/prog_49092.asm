; DESCRIPTION: Places a red 35x18 rectangle at position (181, 169).
; PLAN: r0=181(x), r1=169(y), r2=35(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 169
LDI r2, 35
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
