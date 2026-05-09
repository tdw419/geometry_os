; DESCRIPTION: Places a yellow 60x57 rectangle at position (191, 169).
; PLAN: r0=191(x), r1=169(y), r2=60(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 169
LDI r2, 60
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
