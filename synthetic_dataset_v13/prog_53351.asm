; DESCRIPTION: Places a purple 12x45 rectangle at position (443, 207).
; PLAN: r0=443(x), r1=207(y), r2=12(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 207
LDI r2, 12
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
