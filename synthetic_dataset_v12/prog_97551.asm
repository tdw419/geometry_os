; DESCRIPTION: Places a yellow 95x33 rectangle at position (330, 75).
; PLAN: r0=330(x), r1=75(y), r2=95(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 75
LDI r2, 95
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
