; DESCRIPTION: Places a cyan 59x63 rectangle at position (368, 58).
; PLAN: r0=368(x), r1=58(y), r2=59(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 58
LDI r2, 59
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
