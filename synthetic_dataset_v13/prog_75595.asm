; DESCRIPTION: Places a green 10x56 rectangle at position (121, 169).
; PLAN: r0=121(x), r1=169(y), r2=10(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 169
LDI r2, 10
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
