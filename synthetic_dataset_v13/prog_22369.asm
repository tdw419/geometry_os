; DESCRIPTION: Places a blue 41x55 rectangle at position (44, 47).
; PLAN: r0=44(x), r1=47(y), r2=41(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 47
LDI r2, 41
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
