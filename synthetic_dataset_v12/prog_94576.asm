; DESCRIPTION: Places a orange 20x45 rectangle at position (229, 132).
; PLAN: r0=229(x), r1=132(y), r2=20(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 132
LDI r2, 20
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
