; DESCRIPTION: Places a green 102x75 rectangle at position (392, 26).
; PLAN: r0=392(x), r1=26(y), r2=102(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 26
LDI r2, 102
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
