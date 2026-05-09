; DESCRIPTION: Places a red 38x112 rectangle at position (303, 15).
; PLAN: r0=303(x), r1=15(y), r2=38(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 15
LDI r2, 38
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
