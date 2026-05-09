; DESCRIPTION: Places a purple 76x99 rectangle at position (365, 124).
; PLAN: r0=365(x), r1=124(y), r2=76(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 124
LDI r2, 76
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
