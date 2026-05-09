; DESCRIPTION: Places a orange 120x45 rectangle at position (261, 86).
; PLAN: r0=261(x), r1=86(y), r2=120(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 86
LDI r2, 120
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
