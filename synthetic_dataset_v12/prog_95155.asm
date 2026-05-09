; DESCRIPTION: Places a green 116x48 rectangle at position (350, 208).
; PLAN: r0=350(x), r1=208(y), r2=116(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 208
LDI r2, 116
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
