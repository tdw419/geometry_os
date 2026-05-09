; DESCRIPTION: Places a green 72x23 rectangle at position (363, 21).
; PLAN: r0=363(x), r1=21(y), r2=72(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 21
LDI r2, 72
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
