; DESCRIPTION: Places a red 44x80 rectangle at position (391, 5).
; PLAN: r0=391(x), r1=5(y), r2=44(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 5
LDI r2, 44
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
