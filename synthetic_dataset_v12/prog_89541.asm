; DESCRIPTION: Places a green 13x27 rectangle at position (238, 82).
; PLAN: r0=238(x), r1=82(y), r2=13(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 82
LDI r2, 13
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
