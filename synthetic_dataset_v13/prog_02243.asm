; DESCRIPTION: Places a red 21x16 rectangle at position (96, 169).
; PLAN: r0=96(x), r1=169(y), r2=21(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 169
LDI r2, 21
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
