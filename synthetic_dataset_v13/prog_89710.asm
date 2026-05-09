; DESCRIPTION: Places a green 39x87 rectangle at position (189, 152).
; PLAN: r0=189(x), r1=152(y), r2=39(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 152
LDI r2, 39
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
