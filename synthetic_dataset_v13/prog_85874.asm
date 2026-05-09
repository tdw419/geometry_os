; DESCRIPTION: Places a orange 94x90 rectangle at position (212, 91).
; PLAN: r0=212(x), r1=91(y), r2=94(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 91
LDI r2, 94
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
