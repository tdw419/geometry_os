; DESCRIPTION: Places a green 85x15 rectangle at position (131, 174).
; PLAN: r0=131(x), r1=174(y), r2=85(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 174
LDI r2, 85
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
