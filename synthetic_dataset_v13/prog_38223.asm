; DESCRIPTION: Places a green 72x69 rectangle at position (251, 44).
; PLAN: r0=251(x), r1=44(y), r2=72(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 44
LDI r2, 72
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
