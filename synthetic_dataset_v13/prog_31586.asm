; DESCRIPTION: Places a red 58x25 rectangle at position (445, 193).
; PLAN: r0=445(x), r1=193(y), r2=58(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 193
LDI r2, 58
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
