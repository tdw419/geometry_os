; DESCRIPTION: Places a green 58x82 rectangle at position (272, 120).
; PLAN: r0=272(x), r1=120(y), r2=58(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 120
LDI r2, 58
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
