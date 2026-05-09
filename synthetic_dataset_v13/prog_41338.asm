; DESCRIPTION: Places a yellow 85x32 rectangle at position (248, 152).
; PLAN: r0=248(x), r1=152(y), r2=85(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 152
LDI r2, 85
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
