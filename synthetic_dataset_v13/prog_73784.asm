; DESCRIPTION: Places a green 79x99 rectangle at position (403, 10).
; PLAN: r0=403(x), r1=10(y), r2=79(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 10
LDI r2, 79
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
