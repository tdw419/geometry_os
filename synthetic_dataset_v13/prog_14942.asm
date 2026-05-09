; DESCRIPTION: Places a red 53x20 rectangle at position (453, 208).
; PLAN: r0=453(x), r1=208(y), r2=53(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 208
LDI r2, 53
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
