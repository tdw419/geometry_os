; DESCRIPTION: Places a green 114x47 rectangle at position (385, 169).
; PLAN: r0=385(x), r1=169(y), r2=114(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 169
LDI r2, 114
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
