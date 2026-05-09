; DESCRIPTION: Places a orange 10x63 rectangle at position (290, 190).
; PLAN: r0=290(x), r1=190(y), r2=10(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 190
LDI r2, 10
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
