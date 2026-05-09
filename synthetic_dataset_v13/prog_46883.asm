; DESCRIPTION: Places a green 14x89 rectangle at position (403, 144).
; PLAN: r0=403(x), r1=144(y), r2=14(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 144
LDI r2, 14
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
