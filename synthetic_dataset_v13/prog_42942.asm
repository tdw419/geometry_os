; DESCRIPTION: Places a orange 70x108 rectangle at position (400, 17).
; PLAN: r0=400(x), r1=17(y), r2=70(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 17
LDI r2, 70
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
