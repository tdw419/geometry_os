; DESCRIPTION: Places a orange 70x104 rectangle at position (277, 124).
; PLAN: r0=277(x), r1=124(y), r2=70(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 124
LDI r2, 70
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
