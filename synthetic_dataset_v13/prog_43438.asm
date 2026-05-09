; DESCRIPTION: Places a black 106x47 rectangle at position (152, 191).
; PLAN: r0=152(x), r1=191(y), r2=106(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 191
LDI r2, 106
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
