; DESCRIPTION: Places a black 37x47 rectangle at position (50, 208).
; PLAN: r0=50(x), r1=208(y), r2=37(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 208
LDI r2, 37
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
