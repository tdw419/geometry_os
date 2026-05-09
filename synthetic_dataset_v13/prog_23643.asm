; DESCRIPTION: Places a orange 111x100 rectangle at position (217, 141).
; PLAN: r0=217(x), r1=141(y), r2=111(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 141
LDI r2, 111
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
