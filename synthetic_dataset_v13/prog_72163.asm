; DESCRIPTION: Places a green 102x119 rectangle at position (368, 30).
; PLAN: r0=368(x), r1=30(y), r2=102(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 30
LDI r2, 102
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
