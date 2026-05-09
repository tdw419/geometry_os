; DESCRIPTION: Places a green 58x24 rectangle at position (408, 186).
; PLAN: r0=408(x), r1=186(y), r2=58(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 186
LDI r2, 58
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
