; DESCRIPTION: Places a orange 72x21 rectangle at position (195, 51).
; PLAN: r0=195(x), r1=51(y), r2=72(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 51
LDI r2, 72
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
