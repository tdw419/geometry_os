; DESCRIPTION: Places a red 68x80 rectangle at position (259, 169).
; PLAN: r0=259(x), r1=169(y), r2=68(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 169
LDI r2, 68
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
