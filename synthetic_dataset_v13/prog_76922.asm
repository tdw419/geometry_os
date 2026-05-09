; DESCRIPTION: Places a green 120x102 rectangle at position (85, 138).
; PLAN: r0=85(x), r1=138(y), r2=120(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 138
LDI r2, 120
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
