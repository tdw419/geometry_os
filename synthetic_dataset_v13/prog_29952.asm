; DESCRIPTION: Places a yellow 75x95 rectangle at position (405, 91).
; PLAN: r0=405(x), r1=91(y), r2=75(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 91
LDI r2, 75
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
