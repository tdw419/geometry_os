; DESCRIPTION: Places a red 54x91 rectangle at position (247, 115).
; PLAN: r0=247(x), r1=115(y), r2=54(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 115
LDI r2, 54
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
