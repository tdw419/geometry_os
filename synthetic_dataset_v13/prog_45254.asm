; DESCRIPTION: Places a red 72x102 rectangle at position (300, 40).
; PLAN: r0=300(x), r1=40(y), r2=72(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 40
LDI r2, 72
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
