; DESCRIPTION: Places a green 48x82 rectangle at position (447, 63).
; PLAN: r0=447(x), r1=63(y), r2=48(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 63
LDI r2, 48
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
