; DESCRIPTION: Renders a orange box of size 107x87 starting at (212, 86).
; PLAN: r0=212(x), r1=86(y), r2=107(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 86
LDI r2, 107
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
