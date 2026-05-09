; DESCRIPTION: Places a black 71x25 rectangle at position (336, 220).
; PLAN: r0=336(x), r1=220(y), r2=71(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 220
LDI r2, 71
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
