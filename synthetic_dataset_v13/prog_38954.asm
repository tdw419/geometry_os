; DESCRIPTION: Places a orange 54x55 rectangle at position (418, 164).
; PLAN: r0=418(x), r1=164(y), r2=54(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 164
LDI r2, 54
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
