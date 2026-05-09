; DESCRIPTION: Places a yellow 90x47 rectangle at position (133, 109).
; PLAN: r0=133(x), r1=109(y), r2=90(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 109
LDI r2, 90
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
