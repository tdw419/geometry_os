; DESCRIPTION: Places a orange 33x100 rectangle at position (295, 152).
; PLAN: r0=295(x), r1=152(y), r2=33(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 152
LDI r2, 33
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
