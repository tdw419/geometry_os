; DESCRIPTION: Places a blue 41x50 rectangle at position (408, 142).
; PLAN: r0=408(x), r1=142(y), r2=41(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 142
LDI r2, 41
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
