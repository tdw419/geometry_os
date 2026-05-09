; DESCRIPTION: Places a red 109x44 rectangle at position (192, 191).
; PLAN: r0=192(x), r1=191(y), r2=109(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 191
LDI r2, 109
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
