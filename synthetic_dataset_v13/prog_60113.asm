; DESCRIPTION: Places a red 120x92 rectangle at position (174, 137).
; PLAN: r0=174(x), r1=137(y), r2=120(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 137
LDI r2, 120
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
