; DESCRIPTION: Places a cyan 81x55 rectangle at position (363, 121).
; PLAN: r0=363(x), r1=121(y), r2=81(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 121
LDI r2, 81
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
