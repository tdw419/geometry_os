; DESCRIPTION: Places a orange 75x34 rectangle at position (125, 177).
; PLAN: r0=125(x), r1=177(y), r2=75(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 177
LDI r2, 75
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
