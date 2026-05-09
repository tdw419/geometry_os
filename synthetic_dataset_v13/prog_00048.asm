; DESCRIPTION: Places a red 49x14 rectangle at position (288, 169).
; PLAN: r0=288(x), r1=169(y), r2=49(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 169
LDI r2, 49
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
