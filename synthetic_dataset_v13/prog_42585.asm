; DESCRIPTION: Places a yellow 72x22 rectangle at position (365, 80).
; PLAN: r0=365(x), r1=80(y), r2=72(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 80
LDI r2, 72
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
