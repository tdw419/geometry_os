; DESCRIPTION: Places a orange 79x45 rectangle at position (208, 43).
; PLAN: r0=208(x), r1=43(y), r2=79(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 43
LDI r2, 79
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
