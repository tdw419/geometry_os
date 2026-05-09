; DESCRIPTION: Places a yellow 47x15 rectangle at position (271, 152).
; PLAN: r0=271(x), r1=152(y), r2=47(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 152
LDI r2, 47
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
