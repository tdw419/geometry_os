; DESCRIPTION: Places a black 118x44 rectangle at position (152, 192).
; PLAN: r0=152(x), r1=192(y), r2=118(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 192
LDI r2, 118
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
