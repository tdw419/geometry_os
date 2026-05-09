; DESCRIPTION: Places a blue 21x41 rectangle at position (80, 82).
; PLAN: r0=80(x), r1=82(y), r2=21(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 82
LDI r2, 21
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
