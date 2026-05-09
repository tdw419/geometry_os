; DESCRIPTION: Places a orange 112x45 rectangle at position (124, 143).
; PLAN: r0=124(x), r1=143(y), r2=112(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 143
LDI r2, 112
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
