; DESCRIPTION: Places a blue 11x55 rectangle at position (281, 44).
; PLAN: r0=281(x), r1=44(y), r2=11(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 44
LDI r2, 11
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
