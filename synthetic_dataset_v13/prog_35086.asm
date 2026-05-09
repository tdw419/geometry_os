; DESCRIPTION: Places a green 21x32 rectangle at position (93, 169).
; PLAN: r0=93(x), r1=169(y), r2=21(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 169
LDI r2, 21
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
