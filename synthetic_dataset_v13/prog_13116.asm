; DESCRIPTION: Places a purple 79x61 rectangle at position (393, 55).
; PLAN: r0=393(x), r1=55(y), r2=79(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 55
LDI r2, 79
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
